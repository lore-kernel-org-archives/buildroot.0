Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DA8C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB44A6101F;
	Sun, 30 Jul 2023 21:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB44A6101F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5v0PNkJjIIKp; Sun, 30 Jul 2023 21:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE65261024;
	Sun, 30 Jul 2023 21:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE65261024
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 964B81BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B9EA4152D
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B9EA4152D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fK0hsXgLY5m for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:26:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37A7E409B0
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37A7E409B0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FBA6240004;
 Sun, 30 Jul 2023 21:26:04 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:26:04 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230730232604.36bb1d5e@windsurf>
In-Reply-To: <20230222204134.38884-2-ju.o@free.fr>
References: <20230222204134.38884-1-ju.o@free.fr>
 <20230222204134.38884-2-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690752365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6jmumFEp4dGhB87nTAVndxarjmu4ShHah1x8DWRyZo=;
 b=FiArVDecvVqwlW5X9DRlqcNVZXPG9RWzm6lRNUOJKMVNg+FRNj91D/+ihZovGbwKEhFZxO
 TTnQAyE19MWwONxiewD/k5ze6Ha9M96a4Qsd90U3oPQh3kfcn9HuZA+Bsznl5Cn9E5hEhd
 1FgwgoFlYrJtjj2e6K127IihoqQXxlmYfbfEFjmGzJLH5vhOrsc2RLID6k2QoW9As/DLxP
 ra8WZW/MtwWaWW0fJaDLHgQ0IETm31whSlKqn8UtXUAgYMUHpcV2yrgEJs2m0ejTDTkbUo
 6JJJkM/2aK7CIMe7JkqUu8D+aP4qvPDxQS0ss67DnTwj9KnDH7vy/A1dumYkFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FiArVDec
Subject: Re: [Buildroot] [PATCH next 2/2] package/linux-tools: perf: add
 OpenCSD support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 Feb 2023 21:41:34 +0100
Julien Olivain <ju.o@free.fr> wrote:

> This commit adds the Arm CoreSight trace data Decoder support to perf.
> See: https://docs.kernel.org/trace/coresight/coresight-perf.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/linux-tools/linux-tool-perf.mk.in | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
