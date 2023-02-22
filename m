Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51671C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D875960BA6;
	Wed, 22 Feb 2023 22:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D875960BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZtIzfM-0H04; Wed, 22 Feb 2023 22:22:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BF0660E3E;
	Wed, 22 Feb 2023 22:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF0660E3E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E90AA1BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA2EE8200B
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA2EE8200B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IybuhNaNIB7h for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:22:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33C1681F97
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33C1681F97
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:22:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E76C61C0003;
 Wed, 22 Feb 2023 22:21:57 +0000 (UTC)
Date: Wed, 22 Feb 2023 23:21:57 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20230222232157.380b6109@windsurf>
In-Reply-To: <20221224171920.11256-1-raphael.pavlidis@gmail.com>
References: <20221224171920.11256-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677104518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LflvcO1hW3ShgPfWxFKo0RvcLy6VAQnmRIvhJwp5DtE=;
 b=LiPvElulFwM8bh3dKuLacLsRSw4gk8zruf707Tl9OzM1hEmHdsku6h0yvWk63clHfPfXSv
 hyBPGds/emPr7kGSUYMv6IBfC2Uotz0iww9OmNUxAgCbfE4IVP+66mt4rZlXa6CF4X/OTf
 USw4MLcYUNcpRDstiWqMsZ0iBPc4l0wdSAXU+BRtgR6N1FsRNbUYoD0CpcO8oVg53cA4+/
 mzpwMf6biw6ZOz7VnTPvEVXhg2ZOn99gahUpJXoNGdPk3XkabFPG2Ey9LcC3xbNL1GAeIA
 5kA1kz2tQLnlXUHTPcK9o09++DM8R14m6XhOutHlt9T+i8Qj1gjsxkCiqgc33w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LiPvElul
Subject: Re: [Buildroot] [PATCH v4 1/1] package/shadow: new package
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

On Sat, 24 Dec 2022 18:19:20 +0100
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> shadow provides utilities to deal with user accounts.
> 
> The shadow package includes the necessary programs for converting UNIX
> password files to the shadow password format, plus programs for managing
> user and group accounts. Especially it is useful if rootless podman
> container should be used, which requires newuidmap and newgidmap.
> 
> Co-authored-by: Nicolas Carrier <Nicolas.Carrier@orolia.com>
> [Nicolas.Carrier@orolia.com provided the test case]
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
> Changes v3 -> v4:
> - fix formatting issues in Config.in and shadow.mk.
> - bump to version 4.13.
> - add SHADOW_CPE_ID_VENDOR in shadow.mk.
> - add userdel in the setuid list.
> - fix typo in SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS.

I have finally applied your patch. I fixed only two things:

 - Added a dependency on !BR2_STATIC_LIBS, because shadow uses
   <dlfcn.h> unconditionally

 - Fixed the Config.in comment that already existed that said "shared
   libs", while we normally use "dynamic library".

With those changes, applied to our next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
