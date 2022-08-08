Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A674FC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18F2E4077D;
	Mon,  8 Aug 2022 15:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18F2E4077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2fH6Uz2K_-4; Mon,  8 Aug 2022 15:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D76CE402E0;
	Mon,  8 Aug 2022 15:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D76CE402E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A58991BF2FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DF0F40A71
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DF0F40A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uPguexPUm-B for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:33:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23B4540A5C
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23B4540A5C
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:33:19 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1MWRmF-1nsnaA2V0F-00XubN; Mon, 08 Aug 2022 17:33:17 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 17:33:08 +0200
Message-Id: <20220808153308.20892-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808150641.19475-2-nicolas.cavallari@green-communications.fr>
References: <20220808150641.19475-2-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:CKnrrcHeGlMIpP6+bIZDVFZWdsIXpoTul5TIx5iYt1gWUCgLBZT
 ZB4j34KGz4iDjFB0r/dN6sI6hP8jUQjkO0Zn5IUIR01GiekliMQo7SbII3h1C5kL97HWkO8
 kcG0M8m9QMwd6Y0BUVCtEjyBRRKK84Nc9A1uYZJoMe49gdFLNCne6cJyxWKt2DqYPzWGZpA
 g8HrdS3lRUhMKu6RC0xoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y3SCdg/FUr0=:eDs5g7tEXPYst5XVCjp0Tx
 3xjdISW7GlnyB7nYbhYlAX6EfjRic3wvirFBcDUu0rgnVUCxRQVm5VjPxj7bIqv3yknGssPBn
 wS3fhyiiWnGe4/8Oo9gnBmv5T450V+C9CXw6mX6VOHkLrE7+O8Z/0CTAO3XfLqYqS/fqd98XQ
 UXadbjrVJdvQ01I3RZAKuT5tSb02M8Gf8B4bqA0lky70dPCqx8jVS2mbAWbWOPiW9X9hwXI9x
 dIRReETHq5YIf81jXrrgs8ghoZdBo+/SD9sEsctFHTfXFoEgGyOsUDZvQscJu73aygL4hDEow
 lfqbDXTv0GrAbMzqoQzbKPB+xrWmEhNQAhitikwHGW6TW/9+F5dEOZEOzXiQhzSTL/CHYEuYD
 xYrNxbvAlBxaX1ep52htfz4lSCuIGsgySuXAFEEK4q5+ed1Nrv6JCYxLmWI070PnllSEF1wej
 /ijifkccFa3fnVgVC6wWrhSc32k1axlqCd1wXahFQJqr0mtRQZ95to1/T6v8MULlaA9Ntyo8L
 BfudgeEDXhd1IeR6bdVE6bVRLse+vsGY50bmtCt/PlMFrjrn9IVbn5XXv7bSWZpaCwst/JZly
 7qLYnzZ8PRSPBXJOkOU97kQDCe5FSm/8W690xCCG987GTkEZnhSqOZQ+5LHTvaZbYEpl56bkK
 WGPdQUSdz8AJ4WW/QOhmGF9iE/tJGqEHkuDPHm2UhZ1ug0D0SSJtqks/yA+2mPDF3rTekvzmV
 DJ8npPnYzuYIAR9BAdgnedSMz9P7mjarU0uTYjnOw5kiEm1ZHKDZGPINi2Jb+Knrsbsk1kKeS
 BB7Hfbx
Subject: [Buildroot] [PATCH 2/2 v2] package/libgit2: bump to 1.5.0
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

The upcoming sha256 repository support made them take the sha256
algorithm implementation from RFC6234, hence the license change.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

---
v1 -> v2: fix scissor lines

v1:
Tested with test-pkg with various options on top of 417eb476fd.

It works, except for bootlin-armv7m-uclibc which always fails with
"MMU support available in C library, please enable BR2_USE_MMU"
when configuring the toolchain.
---
 package/libgit2/Config.in    | 10 ++++++++++
 package/libgit2/libgit2.hash |  4 ++--
 package/libgit2/libgit2.mk   | 15 +++++++++++++--
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/package/libgit2/Config.in b/package/libgit2/Config.in
index 9c97676c4a..87f85c1c8f 100644
--- a/package/libgit2/Config.in
+++ b/package/libgit2/Config.in
@@ -14,3 +14,13 @@ config BR2_PACKAGE_LIBGIT2
 
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
index 3f1e6e1593..99659bd511 100644
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
@@ -44,4 +49,10 @@ else
 LIBGIT2_CONF_OPTS += -DUSE_HTTPS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGIT2_CLI),y)
+LIBGIT2_CONF_OPTS += -DBUILD_CLI=ON
+else
+LIBGIT2_CONF_OPTS += -DBUILD_CLI=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
