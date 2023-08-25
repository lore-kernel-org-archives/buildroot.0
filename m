Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11067C3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 17:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD84614CD;
	Fri, 25 Aug 2023 17:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAD84614CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpjDtN_G7_Qr; Fri, 25 Aug 2023 17:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18C99614C0;
	Fri, 25 Aug 2023 17:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18C99614C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1651BF35E
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBBAF614C0
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBBAF614C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gRJoNrgEYXp for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 17:05:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39DA861338
 for <buildroot@uclibc.org>; Fri, 25 Aug 2023 17:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39DA861338
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3128160004;
 Fri, 25 Aug 2023 17:05:33 +0000 (UTC)
Date: Fri, 25 Aug 2023 19:05:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230825190532.43dfeb9b@windsurf>
In-Reply-To: <pan$e13d2$de8bbe61$f0a8808c$96f93b15@ID-313208.user.individual.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
 <20230822225949.2b326664__48539.150941518$1692738023$gmane$org@windsurf>
 <pan$e13d2$de8bbe61$f0a8808c$96f93b15@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692983135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwjYz8j5bSbt6WxcOBWkvF6zSYJV07dh59nB7kvaMAs=;
 b=Z6IryYBIMKFb2ZDOUQa6YaLVNsWRNq3uU9MfeoynFqCtopElC4Ozz6GxAaseisOMemnGtx
 8L9WDGd5zKnklKvfagnr4JQaTU8/MMlW06R7gyDy/9LfXrKRsyhbkzTHl7FnLhnqrGYhcd
 V3mAjCiOZcBw7BBXnD8a3NY2kdlXCrZHfvtZ3ttKjzsdgIBra12DrvFHa3mMt+aa79cnvq
 3/GukWCJYY74PEMd05B38t7UgxdUSAA797Qn/gCogDPFQVhWlxWmiaF0kLi8mfae/mhU3L
 liSQgSP6d7HX9khtRc2nAA4pvavPsqdsMR4Tv+M/Rf4NJKsxGMYYeeCOBWBLzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z6IryYBI
Subject: Re: [Buildroot] [PATCH/next v9 00/12] Introduce libudev (branch
 yem/libudev-6)
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Fri, 25 Aug 2023 18:24:41 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> the reason I am carrying this patch in my personal tree is maintenance of 
> a buildroot-based system which uses
> 
> BR2_ROOTFS_DEVICE_CREATION_STATIC=y
> 
> Without the libudev series I can not use packages like Kodi, and no, I can 
> not change the rootfs setting for this system, sorry.

So you can apply complicated patches/changes, but you cannot adjust the
configuration of your system to use eudev? This does not really sound
like a very good/solid argument in favor of this patch series :-/

Especially when you have Kodi, the size difference between "just
libudev" and "libudev + eudev" is insignificant compared to the size of
Kodi. 

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
