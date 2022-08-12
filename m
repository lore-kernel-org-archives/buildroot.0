Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B19CC00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 14:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5FFB40C19;
	Fri, 12 Aug 2022 14:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5FFB40C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQ6h45h03K_I; Fri, 12 Aug 2022 14:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C36A2404C6;
	Fri, 12 Aug 2022 14:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C36A2404C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CDE61BF5AE
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 14:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57589418F7
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 14:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57589418F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_7fn6tF_WWu for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 14:57:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB90841610
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB90841610
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 14:57:26 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1M1qfu-1oOhxc02X2-002GHA; Fri, 12 Aug 2022 16:57:24 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 16:56:52 +0200
Message-Id: <20220812145652.24342-2-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220812145652.24342-1-nicolas.cavallari@green-communications.fr>
References: <20220812145652.24342-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DgyUbaCqLVBBXom4n19DrTkDHTqeCk7ghfA7jR8Cs9txpVQXCen
 vBIdtXbh99un5ncD245ttUFiOUO1y0NqyJVl7LjSdRolONMdALosKQq3ebmsddgQBWz2Igp
 Ptr2aPgS+SUsrzeHmpQiv+Mo6Va1v3HLZuXROyzQtG2y7ixJr8bItLL/9yhBvlUKhO8DgIp
 U8g3ioaoUGIVCQ79Ib0Kg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:saRDCiRUbpQ=:v5odxj9VEYmvlI6R2mXm6S
 791kxH5PIHyOLUny2y0rmzbKxRNON40717TZnb42EwTyai/8K+ge0WH90tLJP5LjDlkUX45YK
 WnRPHhi0tsoaAfPkWBKesDPBSGEElXi91PgxqnbPCmtkwdz4UeEanLbJZs5zzceNpoIt8KyE/
 T6SqobPW+FnL6M9ehDntdsPKJdNm37CDTErbfoyfS4xZXalTzNjizlv8vwzpfAVaNdrTnccL1
 kJeXG6oSpLqxZmp1jZvEqM4YqrKbJjarjbUbETC3uFhXVZutVy7VMtmgN1Vuu0m2TcmB+74DX
 3aosh8mNgVtyUv+trWCJVczuJVdyewr6Xo84D4v73BPogqQAU/QKquAdmOma7vSXZNvhSug2j
 36DoEuuzznlECQoXJ/Z7JNZ14/cwDwKZHQY56k3A3PgzdF5qwXARUYbIydDt4MrGs0ERmud4E
 AZq+unhgSrtfBHB1YR9fXqqoAXQ2YVt/ClVlu50PECMCO78KDb7M4NX/WsFdmjPQzbdpcUiIQ
 tVfGYA22TQMUPHqxGhrTSdQ6c1aNM8uq+Yp9OYuKmux190P8rTQl17v/lFYiicv3KifJjlbii
 h0aLlleaoJvrjABwTOLAwGO3nKok03I1Y8o/xt8LO0XqF0iJXGrg/x2U1ZhXEWFjecdXaBQd5
 oQm77bNvKvUH1yTDzczyDs38bsoKVRWQzcrEUp24ITKwtnjDtHoC+2oIkgo1i+r5NlINYAGEj
 Z6IRfD42jqNKBB8H81/WRGdeZ5F7ijVqvJ6UGKdYuNj96o98bwjMera3BfV/DxYKtYteM6Yyp
 q3TeeeW
Subject: [Buildroot] [PATCH v3 2/2] package/libgit2: bump to 1.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It includes an option to build a command line program that can be used
to replace git in simple cases.

The upcoming sha256 repository support made them steal the sha256 code
from RFC6234, hence the license change.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

---
v2 -> v3: link executable with -latomic
Tested with test-pkg on top of af972178b

v1 -> v2: fix scissor lines

v1:
Tested with test-pkg with various options on top of 417eb476fd.

It works, except for bootlin-armv7m-uclibc which always fails with
"MMU support available in C library, please enable BR2_USE_MMU"
when configuring the toolchain.
---
 package/libgit2/Config.in    | 10 ++++++++++
 package/libgit2/libgit2.hash |  4 ++--
 package/libgit2/libgit2.mk   | 16 ++++++++++++++--
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/package/libgit2/Config.in b/package/libgit2/Config.in
index a6a9728ff0..5d28f054f2 100644
--- a/package/libgit2/Config.in
+++ b/package/libgit2/Config.in
@@ -12,3 +12,13 @@ config BR2_PACKAGE_LIBGIT2
 
 comment "libgit2 needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+
+if BR2_PACKAGE_LIBGIT2
+
+config BR2_PACKAGE_LIBGIT2_CLI
+	bool "enable command line interface (git2_cli)"
+	help
+	  Enable a command-line interface for libgit2.
+	  It aims to be git-compatible.
+
+endif
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 3b5837f789..fb760fd4cc 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f48b961e463a9e4e7e7e58b21a0fb5a9b2a1d24d9ba4d15870a0c9b8ad965163  libgit2-1.4.3.tar.gz
-sha256  0092f24acc306ee3287dc05b5e85cb9e0e48cd3f11c60c4625b1a673a5912616  COPYING
+sha256  8de872a0f201b33d9522b817c92e14edb4efad18dae95cf156cf240b2efff93e  libgit2-1.5.0.tar.gz
+sha256  0fc09da43d666b5b0cf5695defc3100d5cf387936b260ebab37e396d7e0dbc83  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 9b5e2b897d..9409011eb4 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,9 +4,14 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.4.3
+LIBGIT2_VERSION = 1.5.0
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
-LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch), CC0-1.0 (xoroshiro256)
+LIBGIT2_LICENSE = \
+	GPL-2.0 with linking exception, \
+	MIT (sha1), \
+	BSD-3-Clause (sha256), \
+	wildmatch license (wildmatch), \
+	CC0-1.0 (xoroshiro256)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_CPE_ID_VENDOR = libgit2_project
 LIBGIT2_INSTALL_STAGING = YES
@@ -44,8 +49,15 @@ else
 LIBGIT2_CONF_OPTS += -DUSE_HTTPS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGIT2_CLI),y)
+LIBGIT2_CONF_OPTS += -DBUILD_CLI=ON
+else
+LIBGIT2_CONF_OPTS += -DBUILD_CLI=OFF
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LIBGIT2_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-latomic \
 	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
 endif
 
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
