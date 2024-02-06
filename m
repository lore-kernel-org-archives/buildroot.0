Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAE5C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B60060FC6;
	Tue,  6 Feb 2024 13:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B60060FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbfmsxxB9moJ; Tue,  6 Feb 2024 13:40:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 784FC611ED;
	Tue,  6 Feb 2024 13:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 784FC611ED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1E51BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E870340BFE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E870340BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCgjHOCgCvcd for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:40:00 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD264400F3
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD264400F3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EAABE0004;
 Tue,  6 Feb 2024 13:39:57 +0000 (UTC)
Date: Tue, 6 Feb 2024 14:39:57 +0100
To: Marleen Vos via buildroot <buildroot@buildroot.org>
Message-ID: <20240206143957.6bf13eec@windsurf>
In-Reply-To: <20231219121508.1695768-8-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
 <20231219121508.1695768-8-marleen.vos@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707226798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2SIQj20r/9+QQ57X4ME6auuWbM22J6P1MEnVpkE4Y8I=;
 b=KCnhv5lGVVJpNzLGyoY07wyOhZyFUO/dA+THA174Ogw3hUyAMaT/1WJLIX9sCCY4kKnqHG
 RsmxDILFJr6KuCKZ3D1deNxZAHfLngsQykjZZDVm9w6Om57cBpoXroqML8nXD8ZP8GamCv
 IAp3LjzxC6qsbo/53hOmlUpItSrZkjA9YQVFqeGUXCL/tRSv0F0TApKdY3g2DVS3hf2SK6
 x+AP04R0PtoRAoOP+MeZCF82iCpxDJUY3DrBkEF1XvZtT5HFZqSR3YUZtXXVfsd7dSGuI0
 znmrI5OHNhK5Vb7NIcW7BLN5c1vZhvOyvEPGw/mg1QHrTFojXKXrc8mJxGW6eA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KCnhv5lG
Subject: Re: [Buildroot] [PATCH 7/7] boot/arm-trusted-firmware: bump latest
 version to v2.10
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
Cc: Marleen Vos <marleen.vos@mind.be>, marleen.vos@essensium.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Dec 2023 13:15:08 +0100
Marleen Vos via buildroot <buildroot@buildroot.org> wrote:

> From: Marleen Vos <marleen.vos@mind.be>
> 
> Patch 0001-build-tools-avoid-unnecessary-link.patch that was applied to
> v2.9 is already in v2.10, so no new patch dir for v2.10 is added
> 
> Signed-off-by: Marleen Vos <marleen.vos@mind.be>
> ---
>  boot/arm-trusted-firmware/Config.in                 | 4 ++--
>  boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
