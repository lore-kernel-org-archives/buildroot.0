Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4513C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62BCE84346;
	Sun,  5 Jun 2022 20:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X5VmwkRvdu4x; Sun,  5 Jun 2022 20:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83DE784318;
	Sun,  5 Jun 2022 20:43:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E55A1BF3A8
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BD1984318
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wAUiAwvankp for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:43:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 024D78416E
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:43:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 41F87C0002;
 Sun,  5 Jun 2022 20:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654461807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7s/xs9IdE34DaStSGfQVIHdm+AoPLah8IX7KktbGCto=;
 b=cfhWiBZXT7MY5yEt/r/YlG+nwr+1Q3IoT6Sfx8EmBu1kgWsu+UYaGSfjuiyKdKdOQ96rbU
 nX4zSfLEzs2cwiHcyZBUQTS6FwFVMUltQzBnUxUke7gF2jw5LWdMtSleROgGLBqE4Iyj0o
 vrJbGZs2sWujp5O99XVNZT79RtjGopxkqi/xdRLoIGr2KNpR3Fpt5x2a0fmIFhFneyovop
 jWQVKcoLje66bSQR1Kkkr5Gmsi0b/kVSWHnvW9rYC6KE6xgsDKWKybG63Gp43lmA6ke+0M
 q15os3VPWY4zgB8hxvhCuRTrWZFjiigCJhc6CFkZZv4Xsip8IAvSwgXXHj9eyw==
Date: Sun, 5 Jun 2022 22:43:26 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220605224326.473e3dfc@windsurf>
In-Reply-To: <20220603151123.780877-1-bernd.kuhls@t-online.de>
References: <20220603151123.780877-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-mythtv: bump
 version to 19.0.10-Matrix
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

On Fri,  3 Jun 2022 17:11:23 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
