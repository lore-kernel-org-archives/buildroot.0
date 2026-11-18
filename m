Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36048606A339
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B7g9Z75a
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A845409B9;
	Wed, 18 Nov 2026 11:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svjrpZJpaEri; Wed, 18 Nov 2026 11:44:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 68419409E8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795002255;
	b=TpY7tUxs+RT75+P5S/Fvuoj715BLxqiYawfsxzvk86RGd9zrpmpBWcl7x5VuUE1qT+pq
	 +Nc/mkHbMBe2joQkKmrNJWtCzhf2FyxE97Su4fo6tprIdf0ngTsfh7HB46c9GCTaqZc7f
	 pPUhWEnozx0NCMJKz4SRleWiyC/h3Fc4cMRvO3zLDFSApiPw9YcsOVu7GCE1UA2GhtPy2
	 YLMIXppT+yitC/OkSlk7WNDEKYY+jcsPtvXv23SzMiOquwo14kcBRuz+xBmSw+jTa6w6X
	 5bnD/Lu7wXusBn6gnZFMnUqrh9AzG5wnpBlC+wZSNgmA0T9Kup/CvaM3XonQuDmL4bg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795002255;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tRaStJ95aPeiG0ZZOpcvgHUiTAgZgHxl32XmbYgjRXE=;
	b=sNuPhxR1TsXHkkyMrzEd70CetEhUg7xtxEkC/GLVz+mq0wz3CzHhAuaJ8AOLgdIm/eXz
	 IPQOcB3ytnMgl8/SXXWRhRyZgAkpksE4Vq+FWKxfuNHd08cxDwBJJBpcfMPyQn57tJU6i
	 sX0dhfDKciIdyJQGnomsUrahAjIVPnP7btr18efs0At4PAlzz+ASHQ1zYfrBni218MCW+
	 bqIm2GkJgsP3gRu+q5QEUOsd66hy2c9g/j8lAGpa+55wNoTZLgvOQFHFqXRePNbYrcelS
	 Ew/kotYo8GXRNBJmxNmjZlg8DbzYmW+Z4jbTWr1LEdbmjiNZloV8H3EMh7U+x/a7k9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795002255;
	bh=tRaStJ95aPeiG0ZZOpcvgHUiTAgZgHxl32XmbYgjRXE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=B7g9Z75aa/ASCnC+faXSaouCJMIgnHTDZd5VlQ6ScMwreEdmo/rV+0VHCArpEu3Lc
	 6ckw0jSaiP95y/NDnYUZz5MgT9XBpeTthBOUvAmrzwN9c0cv/828sge/tE6xNWPYxk
	 1ptJdk0k9on8elUe1rbnoJOp3twpoOo6Xocl7D78vbugeF85Eixu/hnsqwtWllyVNZ
	 dxq/m38kk4d3+tjC2Bu2zOfuDPZ2u802Zq1/DovjNElS3tQGuKsncMCkDz5dinnSq3
	 TMH6mGZpy96sCbYPFARTokDUeQASjnZQX4gZpNMuJRmcnctkvqVanKK9h8gM8J4Mxb
	 J5ZjbfwT1bf2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68419409E8;
	Wed, 18 Nov 2026 11:44:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72C4D9F8
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 11:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 579EF409D4
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 11:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJRuBucdab2J for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 11:44:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AC4554095D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC4554095D
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 11:44:11 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6b87a92c17eso1477393a12.3
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 03:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795002250; x=1795607050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Yoy8MqGS4b6ZIEU3FJHCT9IZVPOMojIp6ntzI4JrZUQ=;
 b=DB4m+4xh4mP0jh9/CekUgI15VIN0n92LH2rrRMB0/OpM4G9fIJH2qJq/gM5rPHVCAd
 SQEHmBKKuKYh82SeFSH5AahZpxPveLh/qE2TohxSGTsGgTA8ZaPNahb0hGuhaEXF8fJH
 v5s3KXp2k1PY4ZmYwoiq8wEW6CULXwQsAS4h5dx7bGh0nG/XJP8wpluG6nHlCQzpV2s4
 ixkTMTB68Q8BUohOoJm6/oZ6oV6snf3Ha/m5oF3lDr2OXb39I13EPqZgyJVYDgwWND7K
 ZxNZHgxBso6L4yhEddyOagNCpp8LFdwSFfHWnMLucYNWpLDvo1TmK7kER6Fq3SBLp7PF
 Wq0w==
X-Gm-Message-State: APuU4Z+LkaAqywzS5j9wwCKPUjYE6TxypD3/2/7rMoi8LBEpRZDHEvJz
 BoxuWS8bGWfmGjEq61SAwX8h6fT0avLPHOQQq6Qy4+vE1CT6AxKl/yfmPK1Jvg==
X-Gm-Gg: AYBFou0F2L16EvoagGYzHbvY7KOvaGc3gIzDozXxqj4dJ06U05A1G5jal1gjxqlzAtE
 k91qje6p7gt8Agt6d8J/bjmXgupK3vrufnlP8o6gwiP0QiDPuRktAGlSwUJZKZmp7y1y2A+WvK4
 1FDR5m7h1HrQAm/CcI0vlkpr8MCe4TKFO9BgkjTy3xkp83wwKUqwhAfIkarK9F5oib1tR93aMqq
 ANfJCte6Ly/lKaJlP00G6kQBik81PUkLqlQO+gWJm7luArTxxYDGqfsFKD4kkUD3btFeQkx1c8+
 P3BQE3ztdrAPGBIpT0B595agCRXB29N7UAN3BzW3J8rx3tdMYlSVXa9yw8SLVOe6GrDMEGNuj1W
 8h3psRUnA5MEvzw9lm1RYIlO73wvqt+CcQEQ6U+RFKeVZ5oZWvfDJliHGXD5JYF/DOW916U1LsO
 2X77gujAd267rrbxQO8Fvb2/1winKWUNts7o1DuAIDjcdNiGtkzcOTfuI5T00Qa4Gm/lJJSfgXw
 hU7brOi7gvDp6CNpb7jr0FofDZCX8K22TWbg3L3zK7lEhdUfJMTxEwh7HdY1CGTEx7rwRNi+B5P
 uL/AFewKJgJO+UYBHLCpyJ+y3tfxz+DN/eFPzzWK2NjtVvgZow3v1CLJE5l3NoCYDKJfVDTs6NV
 vQncsnAcz
X-Received: by 2002:a05:6402:912:b0:6b7:b052:e5a4 with SMTP id
 4fb4d7f45d1cf-6b887ec097dmr1639605a12.23.1795002249894; 
 Wed, 18 Nov 2026 03:44:09 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b889c24b8esm916869a12.19.2026.11.18.03.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 03:44:08 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 18 Nov 2026 12:44:06 +0100
Message-Id: <20261118114406.3000754-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118114406.3000754-1-yegorslists@googlemail.com>
References: <20261118114406.3000754-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] linux: switch the xenomai extension to
 Dovetail
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since 3.3, Xenomai only supports the Dovetail interrupt pipeline:
Adeos/I-pipe support was removed, and prepare-kernel.sh now rejects
the --adeos option:

  prepare-kernel.sh: unknown flag: --adeos=...

Replace BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH with
BR2_LINUX_KERNEL_EXT_XENOMAI_DOVETAIL_PATCH, passed to prepare-kernel.sh
with --dovetail, which Xenomai 3.2.x already supports. The option can be
left empty when the kernel already contains Dovetail, e.g. when it is
built from the linux-dovetail tree. As an I-pipe patch can't be used as
a Dovetail patch, the old option is not migrated, but added to
Config.in.legacy.

Drop --default too: it only made prepare-kernel.sh skip the questions
about the kernel tree and architecture, which are always passed, and
is a no-op since Xenomai 3.3.

Also update the help texts that still mention Adeos.

This is a preparation for the bump to Xenomai 3.3.3.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 Config.in.legacy           | 12 ++++++++++++
 linux/Config.ext.in        | 31 +++++++++++++------------------
 linux/linux-ext-xenomai.mk | 26 ++++++++++++--------------
 package/xenomai/Config.in  | 10 +++++-----
 4 files changed, 42 insertions(+), 37 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0ee4d04751..f2f78798e7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
+	string "Adeos/I-pipe patch for Xenomai has been removed"
+	help
+	  Xenomai 3.3 only supports the Dovetail interrupt pipeline,
+	  so the Adeos/I-pipe patch option has been replaced by
+	  BR2_LINUX_KERNEL_EXT_XENOMAI_DOVETAIL_PATCH.
+
+config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH_WRAP
+	bool
+	default y if BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH != ""
+	select BR2_LEGACY
+
 config BR2_KERNEL_HEADERS_7_2
 	bool "kernel headers version 7.2.x are no longer supported"
 	select BR2_LEGACY
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 86af4c338b..513570cf4d 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -3,7 +3,7 @@ menu "Linux Kernel Extensions"
 #-------------------------------------------------------------------------------
 # Xenomai
 config BR2_LINUX_KERNEL_EXT_XENOMAI
-	bool "Adeos/Xenomai Real-time patch"
+	bool "Xenomai/Dovetail Real-time patch"
 	depends on BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # xenomai
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xenomai
@@ -14,28 +14,23 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI
 	  Xenomai is split in two parts: a kernel part and a userspace
 	  part. Enabling this option automatically selects the Xenomai
 	  package and helps in patching the Linux kernel built by
-	  Buildroot with the Xenomai kernel part (ie Adeos/Ipipe).
+	  Buildroot with the Xenomai kernel part (Cobalt).
 
-	  You can find the currently supported kernel versions by
-	  looking at the available patches in the Xenomai sources
-	  tree: ksrc/arch/$(ARCH)/patches
+	  Cobalt requires a kernel with the Dovetail interrupt
+	  pipeline. Either build a kernel from the linux-dovetail
+	  tree, or provide a Dovetail patch matching your kernel
+	  version below:
 
-	  However, it is recommended to use the latest version of the
-	  Adeos/Ipipe patch available at
-	  https://xenomai.org/downloads/ipipe/
+	  https://gitlab.com/Xenomai/linux-dovetail
 
-	  Xenomai is know to support Blackfin, SH4, x86, ARM, NIOS2
-	  and PowerPC architectures.
-
-config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
-	string "Path/URL for Adeos patch file"
+config BR2_LINUX_KERNEL_EXT_XENOMAI_DOVETAIL_PATCH
+	string "Path/URL for Dovetail patch file"
 	depends on BR2_LINUX_KERNEL_EXT_XENOMAI
 	help
-	  Optionally, explicitly specify where to find the Adeos
-	  patch to use.
-	  Examples:
-	  https://xenomai.org/downloads/ipipe/v4.x/arm/ipipe-core-4.19.33-arm-2.patch
-	  or /home/foo/ipipe-core-4.19.33-arm-2.patch
+	  Optionally, explicitly specify where to find the Dovetail
+	  patch to use. Leave empty if the kernel already contains
+	  Dovetail, e.g. when it is built from the linux-dovetail
+	  tree.
 	  Please verify that your kernel version in Buildroot matches.
 
 comment "xenomai needs a uClibc or glibc toolchain w/ threads"
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index 5ec6891bbf..f67ecd6de9 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -1,28 +1,26 @@
 ################################################################################
 #
-# Patch the linux kernel with Adeos/Xenomai extension
+# Patch the linux kernel with Xenomai/Dovetail extension
 #
 ################################################################################
 
 LINUX_EXTENSIONS += xenomai
 
-# Adeos patch version
-XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
+# Dovetail patch
+XENOMAI_DOVETAIL_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_DOVETAIL_PATCH))
 
-ifneq ($(filter ftp://% http://% https://%,$(XENOMAI_ADEOS_PATCH)),)
-XENOMAI_ADEOS_PATCH_NAME = $(notdir $(XENOMAI_ADEOS_PATCH))
-XENOMAI_ADEOS_PATCH_PATH = $(LINUX_DL_DIR)/$(XENOMAI_ADEOS_PATCH_NAME)
+ifneq ($(filter ftp://% http://% https://%,$(XENOMAI_DOVETAIL_PATCH)),)
+XENOMAI_DOVETAIL_PATCH_NAME = $(notdir $(XENOMAI_DOVETAIL_PATCH))
+XENOMAI_DOVETAIL_PATCH_PATH = $(LINUX_DL_DIR)/$(XENOMAI_DOVETAIL_PATCH_NAME)
 # check-package TypoInPackageVariable
-LINUX_EXTRA_DOWNLOADS += $(XENOMAI_ADEOS_PATCH)
-BR_NO_CHECK_HASH_FOR += $(XENOMAI_ADEOS_PATCH_NAME)
+LINUX_EXTRA_DOWNLOADS += $(XENOMAI_DOVETAIL_PATCH)
+BR_NO_CHECK_HASH_FOR += $(XENOMAI_DOVETAIL_PATCH_NAME)
 else
-XENOMAI_ADEOS_PATCH_PATH = $(XENOMAI_ADEOS_PATCH)
+XENOMAI_DOVETAIL_PATCH_PATH = $(XENOMAI_DOVETAIL_PATCH)
 endif
 
-ifeq ($(XENOMAI_ADEOS_PATCH),)
-XENOMAI_ADEOS_OPTS = --default
-else
-XENOMAI_ADEOS_OPTS = --adeos=$(XENOMAI_ADEOS_PATCH_PATH)
+ifneq ($(XENOMAI_DOVETAIL_PATCH),)
+XENOMAI_DOVETAIL_OPTS = --dovetail=$(XENOMAI_DOVETAIL_PATCH_PATH)
 endif
 
 # Prepare kernel patch
@@ -30,6 +28,6 @@ define XENOMAI_PREPARE_KERNEL
 	$(XENOMAI_DIR)/scripts/prepare-kernel.sh \
 		--linux=$(LINUX_DIR) \
 		--arch=$(KERNEL_ARCH) \
-		$(XENOMAI_ADEOS_OPTS) \
+		$(XENOMAI_DOVETAIL_OPTS) \
 		--verbose
 endef
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 13a273a960..6c209219c5 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -45,10 +45,10 @@ if BR2_PACKAGE_XENOMAI
 choice
 	bool "Xenomai version"
 	help
-	  Make sure that the selected version has a patch for your
-	  selected Linux kernel. If it does not, download and select a
-	  patch manually with BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH,
-	  in the Linux Kernel -> Linux Kernel Extensions menu.
+	  Make sure that the selected version supports the Dovetail
+	  version of your Linux kernel. A Dovetail patch can be
+	  selected with BR2_LINUX_KERNEL_EXT_XENOMAI_DOVETAIL_PATCH, in
+	  the Linux Kernel -> Linux Kernel Extensions menu.
 
 config BR2_PACKAGE_XENOMAI_LATEST_VERSION
 	bool "Latest version (3.2.x)"
@@ -115,7 +115,7 @@ config BR2_PACKAGE_XENOMAI_COBALT
 	  Linux kernel.
 
 	  If you want to use Cobalt core, your kernel must have
-	  the Adeos and Xenomai patches applied to it. You can
+	  the Dovetail and Xenomai patches applied to it. You can
 	  add these through the BR2_LINUX_KERNEL_EXT_XENOMAI option
 	  in the Linux Kernel Extensions menu.
 endchoice
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
