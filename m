Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3D9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 23:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DA584189A;
	Tue, 17 May 2022 23:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0O08jq6EpZI; Tue, 17 May 2022 23:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A848F4088E;
	Tue, 17 May 2022 23:37:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A26E1BF8B4
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 23:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45FDE60B35
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 23:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uoeWD4hIfPRl for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 23:37:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DAB660AFB
 for <buildroot@buildroot.org>; Tue, 17 May 2022 23:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XKxnjPaj0l0bDBO6Hslz2FHTw3cNygSs5O9r0U+SOtM=; b=mCe5qtpljmV6XZIGadSZVEwynR
 jMixxa3RCpm9NybsHuA5JHSp3lCOxg2mDNrQtvOcWuq8nshwIC8iRW++kiKeYfEpUGW9L6bdRiInx
 FLS+Pus8vKuje/7VNq477w0dIA23WFqF6hRnsTKkTGJIx0GTmyiRhfXWdmHTgWYaLaQo8uMj68T3c
 5sMRPcGUwes1b1zVdHm1shRs5aE7wM7mnD1hqutYWONKTrISYdu0uG7VfGWCZA/ampnrPEJacnhTS
 vyIIOmMK6mBHsXIl0KYRVAlim3rgTxFvsV3AIPnNj6wZQxDPpRhOdn9C/6pLRfCVTF16K7UDgy3C8
 CSkFd2vg==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nr6ki-00999X-PG; Wed, 18 May 2022 01:37:20 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id fba48a73;
 Tue, 17 May 2022 23:37:10 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 02:37:10 +0300
Message-Id: <20220517233710.4172411-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bubblewrap: bump to version 0.6.2
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version now allows to disable building tests, which allows dropping
the patch "0001-meson-add-tests-option.patch", and contains a few minor
fixes. Release notes can be found at:

  https://github.com/containers/bubblewrap/releases/tag/v0.6.2

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../0001-meson-add-tests-option.patch         | 54 -------------------
 package/bubblewrap/bubblewrap.hash            |  4 +-
 package/bubblewrap/bubblewrap.mk              |  2 +-
 3 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 package/bubblewrap/0001-meson-add-tests-option.patch

diff --git a/package/bubblewrap/0001-meson-add-tests-option.patch b/package/bubblewrap/0001-meson-add-tests-option.patch
deleted file mode 100644
index 32836f925d..0000000000
--- a/package/bubblewrap/0001-meson-add-tests-option.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 34ea0ad841d6f9167db391c08e6cd51471fed6be Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 3 Apr 2022 11:27:06 +0200
-Subject: [PATCH] meson: add tests option
-
-Allow the user to disable tests, for example to avoid the following
-build failure on mips32:
-
-FAILED: tests/try-syscall.p/try-syscall.c.o
-/home/autobuild/autobuild/instance-11/output-1/host/bin/mipsel-buildroot-linux-musl-gcc -Itests/try-syscall.p -Itests -I../tests -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -O3 -D_GNU_SOURCE -Werror=shadow -Werror=empty-body -Werror=strict-prototypes -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=pointer-arith -Werror=init-self -Werror=missing-declarations -Werror=return-type -Werror=overflow -Werror=int-conversion -Werror=incompatible-pointer-types -Werror=misleading-indentation -Werror=missing-include-dirs -Werror=aggregate-return -Werror=switch-default -Wswitch-enum -Wno-sign-compare -Wno-error=sign-compare -Wno-missing-field-initializers -Wno-error=missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O1 -g0 -MD -MQ tests/try-syscall.p/try-syscall.c.o -MF tests/try-syscall.p/try-syscall.c.o.d -o tests/try-syscall.p/try-syscall.c.o -c ../tests/try-syscall.c
-../tests/try-syscall.c:34:5: error: #error "Unknown MIPS ABI"
-   34 | #   error "Unknown MIPS ABI"
-      |     ^~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/cf0365354fc8c16e5871d561daae0fa5039d0bee
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/containers/bubblewrap/commit/34ea0ad841d6f9167db391c08e6cd51471fed6be]
----
- meson.build       | 4 +++-
- meson_options.txt | 6 ++++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 5b63aa64..9277ac4e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -152,4 +152,6 @@ if not meson.is_subproject()
-   subdir('completions')
- endif
- 
--subdir('tests')
-+if get_option('tests')
-+  subdir('tests')
-+endif
-diff --git a/meson_options.txt b/meson_options.txt
-index 2fa3a8c3..a136a3c3 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -38,6 +38,12 @@ option(
-   description : 'enable optional SELINUX support',
-   value : 'auto',
- )
-+option(
-+  'tests',
-+  type : 'boolean',
-+  description : 'build tests',
-+  value : 'true',
-+)
- option(
-   'zsh_completion',
-   type : 'feature',
diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index c3bf4d8212..98fafc3679 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
-# From https://github.com/containers/bubblewrap/releases/tag/v0.6.1
-sha256  9609c7dc162bc68abc29abfab566934fdca37520a15ed01b675adcf3a4303282  bubblewrap-0.6.1.tar.xz
+# From https://github.com/containers/bubblewrap/releases/tag/v0.6.2
+sha256  8a0ec802d1b3e956c5bb0a40a81c9ce0b055a31bf30a8efa547433603b8af20b  bubblewrap-0.6.2.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 81456e9e0d..91864d2b76 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.6.1
+BUBBLEWRAP_VERSION = 0.6.2
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
