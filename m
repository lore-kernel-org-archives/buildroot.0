Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030B4C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 21:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AC2F60ABD;
	Sat, 17 Sep 2022 21:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC2F60ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o-M64ct2In4g; Sat, 17 Sep 2022 21:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9588160A9E;
	Sat, 17 Sep 2022 21:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9588160A9E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D4A71BF3CE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6244884036
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6244884036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdqfWk3hcopj for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 21:10:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8FDF84033
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8FDF84033
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 21:10:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2a18:6673:cb9f:3864])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3301E13F85F;
 Sat, 17 Sep 2022 23:10:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 17 Sep 2022 23:10:29 +0200
Date: Sat, 17 Sep 2022 23:10:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220917211029.GA1127102@scaer>
References: <cover.1660931225.git.yann.morin.1998@free.fr>
 <417c53083693347f5c22298c49c8ff9df1f35d0f.1660931225.git.yann.morin.1998@free.fr>
 <55b0aae8-4e00-990b-2f98-abbb4437c29e@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55b0aae8-4e00-990b-2f98-abbb4437c29e@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663449035;
 bh=sTz1xxNk2gIgXAaCZWcCjmJ5eDuVc1DgaoX1ggncCzQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZYYC3TCU8+oDSwBUz1He0m0XvVw+t8GwjsSvc/3xJgcDK791RXFUxbt4F5644CaFI
 GPMFPQeBincLD1ZpdY3JDKh4RfY2d9iO1nHB1SQn5z3w1kOCixI6eTTIZGqp9PzWXw
 gpZrpI8hKRE+BkoDaf5Oxx6uoZ1Ae96lDcd2lcTxq2+VrfFeLnK84UAm0iPx8bP4yZ
 ZrfM8TYmdhyVTGYJXGNK5R7I+XnUbRGLk1sJZ6NlWOIfKhD/52AFhq7vayOnqqP3UF
 VE9+1d9/IHU2Cy7OXqxF9/BMdTNn4pWpeVMxd1OwaK/Nry1sTKqn8Q9PUTpU0OS9F0
 onInc/v6uf5Cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZYYC3TCU
Subject: Re: [Buildroot] [PATCH 3/4] fs/cpio: accept a list of dracut.conf
 files
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-09-17 22:17 +0200, Arnout Vandecappelle spake thusly:
> On 19/08/2022 19:51, Yann E. MORIN wrote:
> >Allow users to specify more than one dracut config file to cover
> >tose cases.
[--SNIP--]
>  Applied to master, thanks.
[--SNIP--]
> >diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
> >index 861e9a929e..94a826f9e4 100644
> >--- a/fs/cpio/Config.in
> >+++ b/fs/cpio/Config.in
> >@@ -29,13 +29,15 @@ endchoice
> >  if BR2_TARGET_ROOTFS_CPIO_DRACUT
> >-config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
> >-	string "dracut configuration file"
> >+config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES

When that patch was written, we did not have a release yet with support
for dracut, so I did not add a legacy for _CPIO_DRACUT_CONF_FILE when I
made it a plural. But 2022.08 does have dracut, so we now need to handle
the legacy for BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE (or not make it a
plural).

Regards,
Yann E. MORIN.

> >+	string "dracut configuration files"
> >  	default "fs/cpio/dracut.conf"
> >  	help
> >-	  Dracut configuration file. It determines which parts of the
> >-	  rootfs get included in the cpio image. See dracut.conf(5) or
> >-	  https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
> >+	  Space-separated list of Dracut configuration files. They
> >+	  determine which parts of the rootfs get included in the
> >+	  cpio image. See:
> >+	    dracut.conf(5)
> >+	    https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
> >  	  The default configuration file is suitable for busybox init.
> >  	  It doesn't, however, pivot_root into a full rootfs.
> >diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> >index fa66b1c710..d671c337df 100644
> >--- a/fs/cpio/cpio.mk
> >+++ b/fs/cpio/cpio.mk
> >@@ -50,9 +50,14 @@ else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
> >  ROOTFS_CPIO_DEPENDENCIES += host-dracut
> >-ROOTFS_CPIO_DRACUT_CONF_FILE = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE))
> >-ifeq ($(BR_BUILDING):$(ROOTFS_CPIO_DRACUT_CONF_FILE),y:)
> >-$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
> >+ROOTFS_CPIO_DRACUT_CONF_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES))
> >+ifeq ($(BR_BUILDING),y)
> >+ifeq ($(ROOTFS_CPIO_DRACUT_CONF_FILES),)
> >+$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES setting)
> >+endif
> >+ifneq ($(words $(ROOTFS_CPIO_DRACUT_CONF_FILES)),$(words $(sort $(notdir $(ROOTFS_CPIO_DRACUT_CONF_FILES)))))
> >+$(error No two dracut config files can have the same basename, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES setting)
> >+endif
> >  endif
> >  ifeq ($(BR2_LINUX_KERNEL),y)
> >@@ -63,10 +68,14 @@ ROOTFS_CPIO_OPTS += --no-kernel
> >  endif
> >  define ROOTFS_CPIO_CMD
> >-	mkdir -p $(ROOTFS_CPIO_DIR)/tmp
> >+	mkdir -p $(ROOTFS_CPIO_DIR)/tmp $(ROOTFS_CPIO_DIR)/confdir
> >+	$(foreach cfg,$(ROOTFS_CPIO_DRACUT_CONF_FILES), \
> >+		cp $(cfg) $(ROOTFS_CPIO_DIR)/confdir/$(notdir $(cfg))
> >+	)
> >  	$(HOST_DIR)/bin/dracut \
> >  		$(ROOTFS_CPIO_OPTS) \
> >-		-c $(ROOTFS_CPIO_DRACUT_CONF_FILE) \
> >+		-c /dev/null \
> >+		--confdir $(ROOTFS_CPIO_DIR)/confdir \
> >  		--sysroot $(TARGET_DIR) \
> >  		--tmpdir $(ROOTFS_CPIO_DIR)/tmp \
> >  		-M \

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
