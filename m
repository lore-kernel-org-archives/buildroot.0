Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C315C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F164661247;
	Mon,  6 Nov 2023 19:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F164661247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ai4AP1gCVHKJ; Mon,  6 Nov 2023 19:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE4561245;
	Mon,  6 Nov 2023 19:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EE4561245
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84F041BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D9C78242D
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D9C78242D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C9_8QX8oAOAk for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:33:42 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33D92820C3
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D92820C3
Received: by mail.gandi.net (Postfix) with ESMTPSA id F056840008;
 Mon,  6 Nov 2023 19:33:38 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:33:38 +0100
To: Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <20231106203338.27023d3c@windsurf>
In-Reply-To: <20231106121031.57557-1-titouanchristophe@gmail.com>
References: <20231106121031.57557-1-titouanchristophe@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wWBfdY/Bo7OdxBNJGNUJ1488JkLIkIGHPoUAOfog4Rg=;
 b=BUNMhIp8nwlZ2Ei4mjp7k7jAA0eEyg3SbyxQpAnIfzwZnncaJo26dahxCxQXqJpYLSPDf3
 cYf9BhccedHB2vz3ZvFv36aKi8BIh23UH9fL4RrwZ/Qzs/Wcg/IldGPFyOfcaEELuTXPOf
 xpb3DGS8BU0LRenonlXoaySWfn9QIOPDtRaYptlWqmkONZbNl+l32Fun3jH20a3e1QSukX
 7krGoi9ldhR6NjTSX0Ylnw2/s5BedTe315y9FNMKE8BPw+tJ1InOqY85kLsAE5kiyUSvtr
 m586xnq5W269PhhYiN9ZGmUcJ9K5hrFEaGe2nKl+I2DTtP9g0fL45gYlRtAtAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BUNMhIp8
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: bump to v7.2.3
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
Cc: Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 Nov 2023 13:10:31 +0100
Titouan Christophe <titouanchristophe@gmail.com> wrote:

> From the release notes:
> (see https://github.com/redis/redis/blob/7.2.3/00-RELEASENOTES)
> 
>     Upgrade urgency: HIGH, Fixes critical bugs affecting most users.
> 
>     Bug fixes
>     =========
> 
>     * Fix file descriptor leak preventing deleted files from freeing disk
>       space on replicas (#12693)
>     * Fix a possible crash after cluster node removal (#12702)
> 
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
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
