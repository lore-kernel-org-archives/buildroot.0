Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BDF606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=p3h0zn9S
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85844409A9;
	Wed, 28 Oct 2026 21:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5w2yLyZ7-gb; Wed, 28 Oct 2026 21:41:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5CCBE409AC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223665;
	b=BO7fZ7LZ40cczOVzOA8y25RBrgqoasDVt/iOra1nAOE8OxiEVmmymwcKYrdtS1LExNjL
	 XC3fWKqhNFDL06zOu8w5kSL0PjUL8YoJQkcv2cXEhmYJH9ZdP3lexxImfWnwTuyxPkzhw
	 GuqmcNBibfzNsaT14HvUPZVtAhiOcfi/+692rvWwhUECRmg9A2sqkjYFUJ5hsc4K3t7cu
	 uD+cTo8RZMvN6rAfaUV5El7A0e8N2+LB1ONfIwc6q/c9hJ9fboSB64BdLD7sbE2S1uYUn
	 McBq97CHwIGaoC/jfrRLFzvpTT/uAxf8ntdTh9IPkdsCB3kHiI2tES1wmCgsOxjnSJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tl1FxVe9wppmcZV9kybp0Ki9lK/CnkqY9JmDaLKU3L8=;
	b=qBtoAmmdIysDLn0AcLRzUpOh0ACsfLTo48a1V0aEGP2b1i54hYoEsV3JItx0bzmTqgnP
	 +XCoBOfAgQwQ1kClAl9Fov6gkV6AFoeZZsExfIq0WnL1BrZ7g0J+4Gau0H64vcUsCGsaU
	 c2BBsJxZE4PS6Ua9KtD02WUQkNlkBAyKMZlC6vZ0qu1oEQziIZQGpQajZETb2mURSlBHB
	 XWECHx4cjEMM0lVLYMBtIAFgZNYzpp+NcVvLAFmubnavMkhOi/Qx0OVGERtFFxG9kZXL5
	 GuOlgYP1gmZwrS0m4wdCsgWtCn4aHJy9oLvq3VVq53E10HvKZxSMHlp/hAIZv5VcQ1g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223665;
	bh=tl1FxVe9wppmcZV9kybp0Ki9lK/CnkqY9JmDaLKU3L8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=p3h0zn9Sv5JGSfYDyclFKq4miOO89EvV0kGJfqUuLxRTavEC5Ts5m+IrVr8qAoqzn
	 BOxf3AfdiL1bk3uhW4jky0r6rRx+5hOke161Q0B1dCHeDiEbOatTb1RXxRAe9z+tLH
	 A6KA0LIX6DoDlDkUz9Mnbm8/hkC4df5pRuk6zeKYTzQia/uOa+qbhClzz30vE3Oh8c
	 z6jchLf4res8s7VXmcSS8R0lkE5t0166TogDTvtmpVtAGWYsSX6j0CAs8M0JugYiDC
	 OKZPaZ6yNFJzkZOfJ8WrSOpIJkK6hb6s5OZWZtwBNqQIXqPg9q7vT6yL0Jdt4HvNSH
	 MuMXXjCaHo6aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CCBE409AC;
	Wed, 28 Oct 2026 21:41:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4615356
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5F7860748
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybtl8FCFcSKl for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:41:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C464160725
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223663;
 b=HkeMMMM8elZp1uAa32ghThp86kteFc7tFUGUU241l3Eueg+LRkibeBMf/rmW4QqX7EUs
 12W90TXRmluTw+rEmps37/g10A4Gm+rl7/icxGDLYTPOMWtM+X4kYJ+ksTc+l4wbPM755
 npbFlB5CVD9DLp5K9Tzb54wxsBWlPqGDh3l6hqyYkRiom+9B6ouan2wN56+1lJvx4Y6JK
 3rLZYMfQSvYpV0txnbOmSH0O7c0EcGKzIX5vaYEEYpSgDWIbvZYo0uNZItqWANfNDJqBd
 DeaotBz07/gSz1T2VcdsXYpbosd86jH24A9efKCSyTnbM8TQMiS+reAK83JTUL0q70A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223663;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=mgRAQaXbukh37aVXhRlihBwfBlx504J2hgkb15G3CCY=;
 b=Iz6Iziw1dHxDKTJVxJtap/bD/mzgvOFhNP7FX0EIAA6pJT9klGuWcpwGAs6uU/tZkUjO
 Vy3LOCTgrkprE+PEYlIBF7bkgDrSd1IDB8/xtNsNTxS+7Fv+k+3zeblMcsZ7NRZ+GI0BU
 CBaNFrQOqHZuXydZH47qd/xilJgXaK52gXbYh1BGYPAHOKxBNB1rB+49yl4giKa55v0+O
 Gza8BCmX5f/s3FaQ+bOI0Tl99+s53l7fFilEodDSdZswBlzoqvQhVGfDqLQ7pKBoo4ewS
 YYYa5IZ7pj1EH4VtxJZ1jSMGRr8CLYfKVW7SDpqYp2XBOZgtD15QUUbO43lERd9ld7g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=X6kOcdQi; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::863"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::863; helo=mail-qt1-x863.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-qt1-x863.google.com (mail-qt1-x863.google.com
 [IPv6:2607:f8b0:4864:20::863])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C464160725
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:02 +0000 (UTC)
Received: by mail-qt1-x863.google.com with SMTP id
 d75a77b69052e-53669f7b518so18558501cf.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223661; x=1793828461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mgRAQaXbukh37aVXhRlihBwfBlx504J2hgkb15G3CCY=;
 b=Biy68kK2Pt/Hk4nngzAw/gt4urZO8AXEiqbX+jHm/i5I9+LV02jExOZDyxuSClor8A
 P0Nm2UAJXQffJHWG9aoV7tOuAPgJkyoPZ/BwN0K33nobzbaUj4WI6WPo8UozUZLFwQZh
 Q1pZPFNF94X++ivZFBB5xMTusXUVUJZXgX5p9fJoY7D04eTLTjE3CHWsIXzO9qhOfqio
 YcJQy6YvUonoNSYPBPik5WJFWnWGMQ0a0bqQEnM1tpnCRIICtisqP5GN7mJ8VM+4kk2G
 xntWD2R8Txdgf7X0HeIle3rLvBNlgBrCTVDEH+qef2QwqiEbEjNRSFmH1sy925mE16jF
 q7tw==
X-Gm-Message-State: AFq9FYJP7eWTLS3MmkSu9qb+dTaJb/7+BznOqxI2bBC5ULjRVam/LGzt
 ITcj8ZP4P3it6kZojUZsJjdl5PKTwemjYrMGl9of3YehcUsl+djUFxA0EQCN0EQOA/aWOybiNVf
 opUZQ3iJhuDsZvBSUxGL2vN4ixFIFJJkLtFI8z/mCTU6nuxjkPPdr62ZuFGHw6NsLZ61qBK3pZM
 HTQGiw0ZeJkPzMbVnyI86GuV5gVIT7W5IRnrDKhJ+46CaDFMMxovdbDhVIWThusoU4eiHv3qxoh
 YHMrTr+8HIxMLxt3g==
X-Gm-Gg: AYBFou3DEw+Qbf1hUd7UAiGhffaDk0bPiem3vQ+79kzJz+3XnC8SGW2Yqe2lJrExtxq
 x4rYiZ2eQlTv8EWMeTR9PiwU3nQiOkHgMmPc0/mTLXUPcEv8q7Y4iEAF5xqPirzvnF7rEmaK9Fu
 K+OaxIHbwF9rnsTmXokjjvVyVob0RsRzbb8HzD9WZEjpZZx8ORue6oHbVfKRdLIGLsSCycZ6OXS
 NiLvFGyu8H2eOkc1QqoiZubRYL8E1ObEIfHdxhkVq8kF0RNGtShzD4fstd95VjJO/SrwTOVplD6
 60dBSnZUfi6cQfGTego0BSMbvgHp8rkk66/EDtxI38gQt9Og70TflghR30cn6JQJsJ9aHSEqCAD
 gAFEbP1a3oAn0uoGR9Dh5l7LkuSU7LU7fSzv174U4QpYFrvSDUBUQLhpuuBdfPuzJxA7wpAAmCJ
 Qzymf37uyzHDci6nKguEOHwjOa4FwuD9OlmHyoQ3Uc
X-Received: by 2002:a05:622a:4109:b0:535:855e:6d15 with SMTP id
 d75a77b69052e-53fcbbe6ea7mr63088051cf.30.1793223660876; 
 Wed, 28 Oct 2026 14:41:00 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 d75a77b69052e-538382a92adsm1036251cf.23.2026.10.28.14.40.59
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:41:00 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5339739b343so34185441cf.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:40:59 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8d:b0:535:d4d8:eec2 with SMTP id
 d75a77b69052e-53fc8fac7f3mr63804151cf.4.1793223659130; 
 Wed, 28 Oct 2026 14:40:59 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8d:b0:535:d4d8:eec2 with SMTP id
 d75a77b69052e-53fc8fac7f3mr63803611cf.4.1793223658390; 
 Wed, 28 Oct 2026 14:40:58 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-538394c518csm114745971cf.8.2026.10.28.14.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:40:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:41 -0700
Message-Id: <20261028213744.511429-21-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 20/23] linux: support custom logo and
 devicetree files in out-of-tree builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A custom logo and custom devicetree files are added to the kernel
sources, which must not be done in a source directory we do not own.

When either is configured for an out-of-tree build, build from a shadow
of the source directory instead: a tree of real directories containing
symlinks to the files (support/scripts/symlink-tree), where files can
be replaced or added without touching the original. Packages opt in by
setting <pkg>_OUT_OF_TREE_SRCDIR.

Custom files are copied with --remove-destination so that a symlink is
replaced rather than written through.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 linux/linux.mk               | 34 ++++++++++++++++-----
 package/pkg-generic.mk       |  5 +++-
 support/scripts/symlink-tree | 58 ++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+), 8 deletions(-)
 create mode 100755 support/scripts/symlink-tree

diff --git a/linux/linux.mk b/linux/linux.mk
index 5734d78aa9a2..37d143742435 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -227,7 +227,7 @@ LINUX_DTSO_NAMES += $(basename $(LINUX_DTSO_LIST))
 define LINUX_COPY_CUSTOM_DTS_FILES
 	$(foreach d, $(LINUX_KERNEL_CUSTOM_DTS_DIR), \
 		@$(call MESSAGE,"Copying devicetree overlay $(d)")$(sep) \
-		$(Q)$(call SYSTEM_RSYNC,$(d),$(LINUX_ARCH_PATH)/boot/dts/)$(sep))
+		$(Q)$(call SYSTEM_RSYNC,$(d),$(LINUX_SRC_ARCH_PATH)/boot/dts/)$(sep))
 endef
 endif
 
@@ -291,14 +291,18 @@ endif
 # for bzImage, arch/i386 and arch/x86_64 do not exist when copying the
 # defconfig file.
 ifeq ($(KERNEL_ARCH),i386)
-LINUX_ARCH_PATH = $(LINUX_DIR)/arch/x86
+LINUX_ARCH_SUBDIR = arch/x86
 else ifeq ($(KERNEL_ARCH),x86_64)
-LINUX_ARCH_PATH = $(LINUX_DIR)/arch/x86
+LINUX_ARCH_SUBDIR = arch/x86
 else ifeq ($(KERNEL_ARCH),sparc64)
-LINUX_ARCH_PATH = $(LINUX_DIR)/arch/sparc
+LINUX_ARCH_SUBDIR = arch/sparc
 else
-LINUX_ARCH_PATH = $(LINUX_DIR)/arch/$(KERNEL_ARCH)
+LINUX_ARCH_SUBDIR = arch/$(KERNEL_ARCH)
 endif
+# Build products (images, dtbs) are in the build directory, but the sources
+# of the kernel, to which custom files are added, may be elsewhere.
+LINUX_ARCH_PATH = $(LINUX_DIR)/$(LINUX_ARCH_SUBDIR)
+LINUX_SRC_ARCH_PATH = $(LINUX_SRCDIR)/$(LINUX_ARCH_SUBDIR)
 
 ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
@@ -356,13 +360,29 @@ LINUX_KERNEL_CUSTOM_LOGO_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOGO_PAT
 ifneq ($(LINUX_KERNEL_CUSTOM_LOGO_PATH),)
 LINUX_DEPENDENCIES += host-imagemagick
 define LINUX_KERNEL_CUSTOM_LOGO_CONVERT
+	rm -f $(LINUX_SRCDIR)/drivers/video/logo/logo_linux_clut224.ppm
 	$(HOST_DIR)/bin/convert $(LINUX_KERNEL_CUSTOM_LOGO_PATH) \
 		-dither None -colors 224 -compress none \
-		$(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
+		$(LINUX_SRCDIR)/drivers/video/logo/logo_linux_clut224.ppm
 endef
 LINUX_PRE_BUILD_HOOKS += LINUX_KERNEL_CUSTOM_LOGO_CONVERT
 endif
 
+# A custom logo or custom devicetree files are added to the kernel sources,
+# which we must not do in a source directory we do not own. In an out-of-tree
+# build, use a shadow of that directory instead: a tree of real directories
+# containing symlinks to the files, so that those can be replaced or added.
+ifneq ($(LINUX_OVERRIDE_SRCDIR),)
+ifneq ($(LINUX_KERNEL_CUSTOM_LOGO_PATH)$(LINUX_KERNEL_CUSTOM_DTS_DIR)$(LINUX_CUSTOM_DTS_PATH),)
+LINUX_OUT_OF_TREE_SRCDIR = $(BUILD_DIR)/linux-custom-src
+define LINUX_SHADOW_SRCDIR
+	@$(call MESSAGE,"Shadowing $(LINUX_OVERRIDE_SRCDIR) for custom files")
+	support/scripts/symlink-tree -F -l .git $(call qstrip,$(LINUX_OVERRIDE_SRCDIR)) $(LINUX_OUT_OF_TREE_SRCDIR)
+endef
+LINUX_PRE_RSYNC_HOOKS += LINUX_SHADOW_SRCDIR
+endif
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
@@ -561,7 +581,7 @@ endif
 define LINUX_BUILD_CMDS
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
 	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
-		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
+		cp -f --remove-destination $(dts) $(LINUX_SRC_ARCH_PATH)/boot/dts/
 	)
 	$(LINUX_COPY_CUSTOM_DTS_FILES)
 	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b9808bb624f7..14378deacd35 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -581,7 +581,10 @@ ifeq ($$($(3)_SUPPORTS_OUT_OF_TREE),YES)
 $(2)_OUT_OF_TREE = YES
 $(2)_SRCDIR = $$(SRC_DIR)/$$($(2)_BASENAME)
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-$(2)_SRCDIR = $$(abspath $$(call qstrip,$$($(2)_OVERRIDE_SRCDIR)))
+# A package may need to add files to its sources, which must not be done in
+# the overridden directory: it can then set <pkg>_OUT_OF_TREE_SRCDIR to
+# a shadow of the sources (see support/scripts/symlink-tree).
+$(2)_SRCDIR = $$(or $$($(3)_OUT_OF_TREE_SRCDIR),$$(abspath $$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))))
 $(2)_STAMP_SRCDIR = $$($(2)_BUILDDIR)
 endif
 endif
diff --git a/support/scripts/symlink-tree b/support/scripts/symlink-tree
new file mode 100755
index 000000000000..6c51022dddad
--- /dev/null
+++ b/support/scripts/symlink-tree
@@ -0,0 +1,58 @@
+#!/usr/bin/env bash
+
+# Create a "shadow" of a source tree: a tree of real directories whose
+# files are symlinks to the files of the original tree. Files can then be
+# added to, or replaced in, the shadow, and objects can be built inside it,
+# without ever modifying the original tree.
+#
+# Usage: symlink-tree [-F] [-f NAME]... [-l NAME]... SRC DST
+#
+#   -F       shadow every top-level entry of SRC (default: a single symlink
+#            for each top-level entry)
+#   -f NAME  shadow the top-level directory NAME
+#   -l NAME  only symlink the top-level entry NAME, even with -F
+#
+# DST is wiped and re-created.
+
+set -e
+
+all=false
+farm=" "
+link=" "
+while getopts "Ff:l:" opt; do
+    case "${opt}" in
+    F) all=true ;;
+    f) farm="${farm}${OPTARG} " ;;
+    l) link="${link}${OPTARG} " ;;
+    *) exit 1 ;;
+    esac
+done
+shift $((OPTIND - 1))
+[ $# -eq 2 ] || { echo "usage: ${0##*/} [-F] [-f NAME]... [-l NAME]... SRC DST" >&2; exit 1; }
+
+src="$(readlink -f "${1}")"
+dst="${2}"
+
+# Refuse to wipe anything that does not look like a previous shadow, or
+# that could be (part of) the source tree.
+dst_abs="$(readlink -m "${dst}")"
+case "${src}/" in
+"${dst_abs}"/*) echo "${0##*/}: ${dst} contains the source tree" >&2; exit 1 ;;
+esac
+case "${dst_abs}/" in
+"${src}"/*) echo "${0##*/}: ${dst} is inside the source tree" >&2; exit 1 ;;
+esac
+
+rm -rf "${dst}"
+mkdir -p "${dst}"
+
+for path in "${src}"/* "${src}"/.[!.]* "${src}"/..?*; do
+    [ -e "${path}" ] || [ -L "${path}" ] || continue
+    name="${path##*/}"
+    if [ -d "${path}" ] && [ ! -L "${path}" ] && [[ "${link}" != *" ${name} "* ]] &&
+       { ${all} || [[ "${farm}" == *" ${name} "* ]]; }; then
+        cp -rs "${path}" "${dst}/"
+    else
+        ln -s "${path}" "${dst}/${name}"
+    fi
+done
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
