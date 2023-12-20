Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F54BC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 21:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 076516158E;
	Wed, 20 Dec 2023 21:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 076516158E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVeRRstjQTWi; Wed, 20 Dec 2023 21:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FA5461570;
	Wed, 20 Dec 2023 21:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FA5461570
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F4601BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 21:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DACE143714
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 21:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DACE143714
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bWQHxewdWj8o for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 21:01:18 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B585843706
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 21:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B585843706
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5ECC40004;
 Wed, 20 Dec 2023 21:01:14 +0000 (UTC)
Date: Wed, 20 Dec 2023 22:01:13 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231220220113.4fa59182@windsurf>
In-Reply-To: <20231220202818.165002-1-giulio.benetti@benettiengineering.com>
References: <20231220202818.165002-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703106075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlOmFSOwSfxrC1FHgGvbxp9XvX/KTH9muLJlcr2XpnM=;
 b=hwqQoOshuKS01MtdxMKqdMzQ12F7iR7Ovx3g4qLGn0NpW+JKcU+9j9rXuE/D5Gd+0x67Ps
 LlpGRLLLZcEVU7b54XCGJSFwjznpvqZ3wiZxsgE/C3L8qIQ9oDFgyYtmb2u3a+b8nes7Ol
 Z960thNeF1KwfQdPAhgt3ErIxvBO2PqqngQMxyjM/cMInXyqPgCRYSWmIubwyJGlHJ0sn4
 td/Np68q138uImfXcSpAll8zKwtbZPmJJnnBex8WIRllXKu39T/TdJeH+7R3hlvQjkLXpA
 kWUFLvLasWpo6YpW33HTtqKJpHx7ISp0mdEl5/zWqgYPynBY5gND3rrqwIikIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hwqQoOsh
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump to version 1.7.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 20 Dec 2023 21:28:18 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnvme/libnvme.hash | 2 +-
>  package/libnvme/libnvme.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
