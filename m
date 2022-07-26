Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF037C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76A4240612;
	Tue, 26 Jul 2022 16:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76A4240612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnP_S1bvPWXz; Tue, 26 Jul 2022 16:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E5AA40148;
	Tue, 26 Jul 2022 16:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E5AA40148
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5EF51BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C74140148
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C74140148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZsiUYFOJ9z0k for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:56:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E4F34013C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E4F34013C
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:56:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AF50760002;
 Tue, 26 Jul 2022 16:56:48 +0000 (UTC)
Date: Tue, 26 Jul 2022 18:56:47 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220726185647.7ba6303c@windsurf>
In-Reply-To: <20220724235818.679881-1-christian@paral.in>
References: <20220724235818.679881-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658854609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8RLWcuND4TU4qb9tw2qJL1Y5Q0g4b4IOt2/GSqtqmY=;
 b=RnH+sWYM/3jVtxyANWaG71/EQlQUptWINbC0uZQy5p7/36Lc5T0S27H5NSc7TPb12G38Fo
 sOckJXjwAdUqTHTuKWyyD0PvZ+1EvUJatbvSLmzara2esxcuH4aLV+auThvwpMLJhR2OAc
 v8ho+xXg2PRSqgrgbus1qhC0jPWDnjmfp80FGPdRWTNnkBAfS2wE/m+1H3O8pa2KD/cSPX
 KdK4NGnwo6TuJRAbRKbTCSJwhE9nWQN2C6cHTNf2BBoiGArOvGqTONJ5fDIo3Gp04IQC/o
 ig7lBhU1FfxzP21YCGyOwS5chNlIPker57Ox+ORMbs0XmRcgGvaWiTmlus8Ifg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RnH+sWYM
Subject: Re: [Buildroot] [PATCH 1/1] package/mkbootimg: new host package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for your contribution! See some comments below.

On Sun, 24 Jul 2022 16:58:18 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Android bootimg utilities: mkbootimg and unpackbootimg.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in.host                        |  1 +
>  ...akefile-remove-cc-and-ar-definitions.patch | 97 +++++++++++++++++++
>  package/mkbootimg/Config.in.host              |  4 +
>  package/mkbootimg/mkbootimg.hash              |  3 +
>  package/mkbootimg/mkbootimg.mk                | 26 +++++
>  5 files changed, 131 insertions(+)

Entry in the DEVELOPERS file is missing.

> diff --git a/package/mkbootimg/0001-makefile-remove-cc-and-ar-definitions.patch b/package/mkbootimg/0001-makefile-remove-cc-and-ar-definitions.patch
> new file mode 100644
> index 0000000000..d61b1e0b88
> --- /dev/null
> +++ b/package/mkbootimg/0001-makefile-remove-cc-and-ar-definitions.patch
> @@ -0,0 +1,97 @@
> +From 04a62922ce238f3106a916a30c0c2995ffa1526c Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Sat, 14 May 2022 20:58:14 -0700
> +Subject: [PATCH] makefile: remove cc and ar definitions
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---
> + Makefile             | 26 +-------------------------
> + libmincrypt/Makefile | 27 +++++----------------------
> + 2 files changed, 6 insertions(+), 47 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 6ee3a38c..39d0996b 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,29 +1,4 @@
> + # Andrew Huang <bluedrum@163.com>
> +-ifeq ($(CC),cc)
> +-CC = gcc
> +-endif
> +-AR = ar rcv
> +-ifeq ($(windir),)
> +-EXE =
> +-RM = rm -f
> +-else
> +-EXE = .exe
> +-RM = del
> +-endif
> +-
> +-CFLAGS = -ffunction-sections -O3
> +-
> +-ifneq (,$(findstring darwin,$(CROSS_COMPILE)))
> +-    UNAME_S := Darwin
> +-else
> +-    UNAME_S := $(shell uname -s)
> +-endif
> +-ifeq ($(UNAME_S),Darwin)
> +-    LDFLAGS += -Wl,-dead_strip
> +-else
> +-    LDFLAGS += -Wl,--gc-sections -s
> +-endif

This is not needed. They can be overridden on the command line, as long
as you pass them to the right side of make, i.e:

	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)

The CC, CFLAGS, LDFLAGS from HOST_CONFIGURE_OPTS will take precedence
over the ones defined in the Makefile.

> +-
> + all:mkbootimg$(EXE) unpackbootimg$(EXE)
> + 
> + static:
> +@@ -31,6 +6,7 @@ static:
> + 
> + libmincrypt.a:
> + 	$(MAKE) -C libmincrypt
> ++	cp ./libmincrypt/libmincrypt.a ./libmincrypt.a

This added line is not related to the patch.

> + 
> + mkbootimg$(EXE):mkbootimg.o libmincrypt.a
> + 	$(CROSS_COMPILE)$(CC) -o $@ $^ -L. -lmincrypt $(LDFLAGS)
> +diff --git a/libmincrypt/Makefile b/libmincrypt/Makefile
> +index ad482de9..c7c478ff 100755
> +--- a/libmincrypt/Makefile
> ++++ b/libmincrypt/Makefile
> +@@ -1,31 +1,14 @@
> +-ifeq ($(CC),cc)
> +-CC = gcc
> +-endif
> +-AR = ar rc
> +-ifeq ($(windir),)
> +-RM = rm -f
> +-CP = cp
> +-else
> +-RM = del
> +-CP = copy /y
> +-endif
> +-
> +-CFLAGS = -ffunction-sections -O3
> +-EXT = a
> +-LIB = libmincrypt.$(EXT)
> ++LIB = libmincrypt.a

Same comment. And EXT = a doesn't cause any problem.

> + LIB_OBJS = dsa_sig.o p256.o p256_ec.o p256_ecdsa.o rsa.o sha.o sha256.o
> + INC  = -I..
> + 
> +-all:$(LIB)
> ++all: $(LIB)

Spurious change.

> + 
> + clean:
> + 	$(RM) $(LIB_OBJS) $(LIB)
> + 
> +-$(LIB):$(LIB_OBJS)
> +-	$(CROSS_COMPILE)$(AR) $@ $^
> +-	$(CP) $@ ..
> +-
> ++$(LIB): $(LIB_OBJS)
> ++	$(CROSS_COMPILE)$(AR) rc $@ $^

Why?

> + 
> +-%.o:%.c
> ++%.o: %.c

Spurious change.

> diff --git a/package/mkbootimg/Config.in.host b/package/mkbootimg/Config.in.host
> new file mode 100644
> index 0000000000..2ca7bcae00
> --- /dev/null
> +++ b/package/mkbootimg/Config.in.host
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_HOST_MKBOOTIMG
> +	bool "host mkbootimg"
> +	help
> +	  Android Bootimg mkbootimg and unpackbootimg utils.

Missing link to the upstream Github project.

> +define HOST_MKBOOTIMG_BUILD_CMDS
> +	$(foreach t,$(HOST_MKBOOTIMG_TARGETS),\
> +		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \

Are you sure SRCDIR is needed?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
