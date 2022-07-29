Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB67FC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 09:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB5F6105D;
	Fri, 29 Jul 2022 09:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB5F6105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUHKmZcANHzL; Fri, 29 Jul 2022 09:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC7F60E3C;
	Fri, 29 Jul 2022 09:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CC7F60E3C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83C5D1BF339
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 09:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09E6683F54
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 09:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E6683F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dunW59EADB0F for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 09:42:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DFDE8250B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DFDE8250B
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 09:42:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3529720009;
 Fri, 29 Jul 2022 09:42:52 +0000 (UTC)
Date: Fri, 29 Jul 2022 11:42:51 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20220729114251.217a4104@windsurf>
In-Reply-To: <CA+h8R2rq1GonYRs0o=BN_gcJnJwYCVosjY9FEeZs-3os97Kt8w@mail.gmail.com>
References: <20220724234718.676572-1-christian@paral.in>
 <20220726191133.26dba919@windsurf>
 <CA+h8R2rq1GonYRs0o=BN_gcJnJwYCVosjY9FEeZs-3os97Kt8w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659087772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeixjKxWmnqmfvKTohfxwddc5d1yyHD+2g5CYqQwNHk=;
 b=niFjdy9vDJvFUF1eNoICq6NSs/dqNp0JBl5CYOJ9f3CMGadhRK//vVz3zS+RvCXoH9jnfb
 FgZeu8O2QaddRHW0MDnShdzrJWI2S1IGhK83DF5EP1C+eeiEs0jarU4TPfZlbgpKTeYJ4J
 H9Kpj02sryER8AYVZQ95Ub5yIJMnXHGKheD7VS7wzpuaUjw1KU5iDGu/D/sDzUKGJEhTmA
 ue9k9GBUoCNSGYZBW/eYco0zljXrv83SK8Ne3PPoaCfKwqLtVPJXqbmwr7387WXjMcaT7O
 ovml29TpxtrSVCtvgEBzqQyjYlTWM6Qq1yc4tJPgACg/ZrT1ui7tPD2cA5oX4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=niFjdy9v
Subject: Re: [Buildroot] [RFC PATCH v1 1/1] package/android-tools: update to
 version 5.1.1.r38
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Thu, 28 Jul 2022 08:24:18 -0700
Christian Stewart <christian@paral.in> wrote:

> ACK on your comments.
> 
> However, I think even this updated version is still extremely old.
> 
> It doesn't have all of the arguments like --page-size or even --version
> 
> The Gentoo package reports version 31.0.3-android-tools
> 
> That's way way way more recent than 5.x, right?
> 
> I'm a bit confused on these version schemes.
> 
> https://github.com/nmeum/android-tools

I have no idea how this is maintained. It's probably a bit crappy as
this is forked from the Android code base. So far, we were using the
android-tools packaged in Ubuntu, therefore available on Launchpad.

This other Github repository you're pointing to perhaps uses a
different version scheme.

> This package has a Cmake version of building it which seems much
> cleaner, and also brings in all the other tools like simg.
> 
> To be able to build it, it requires using the Git submodules method:
> 
> ANDROID_TOOLS_VERSION = 31.0.3p1
> ANDROID_TOOLS_SITE = https://github.com/nmeum/android-tools
> ANDROID_TOOLS_SITE_METHOD = git
> ANDROID_TOOLS_LICENSE = Apache-2.0
> ANDROID_TOOLS_GIT_SUBMODULES = YES
> 
> And carries its own patches for adb, etc.
> 
> Would it be desirable to switch to this version instead? I certainly
> would prefer it for my purposes.

This seems like a reasonable solution. I see that a Go compiler is
needed. Is it because the android tools developed by Google are now
written in Go?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
