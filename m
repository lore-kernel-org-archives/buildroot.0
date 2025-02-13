Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84960C0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 09:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF5418187F;
	Thu, 13 Feb 2025 09:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfIybzWsELES; Thu, 13 Feb 2025 09:33:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 783ED80F8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 783ED80F8D;
	Thu, 13 Feb 2025 09:33:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D46412D
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 09:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04356813A6
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 09:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H63X6QCuq8Vr for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 09:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2575D80E0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2575D80E0C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2575D80E0C
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 09:33:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BDD44315F;
 Thu, 13 Feb 2025 09:33:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tiVau-00E886-1j;
 Thu, 13 Feb 2025 10:33:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Feb 2025 10:33:14 +0100
Message-Id: <20250213093314.3367824-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpedtteegkeekjedugeegleelueeuheetuddvvdejkefghefgtdeileehffdviedttdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/rnnoise: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RNNoise is a noise suppression library based on a recurrent neural network.

Add an upstream post-0.2 patch to fix a build issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../rnnoise/0001-Fix-compilation-errors.patch | 147 ++++++++++++++++++
 package/rnnoise/Config.in                     |   7 +
 package/rnnoise/rnnoise.hash                  |   3 +
 package/rnnoise/rnnoise.mk                    |  15 ++
 6 files changed, 174 insertions(+)
 create mode 100644 package/rnnoise/0001-Fix-compilation-errors.patch
 create mode 100644 package/rnnoise/Config.in
 create mode 100644 package/rnnoise/rnnoise.hash
 create mode 100644 package/rnnoise/rnnoise.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5f98257b86..74a9647905 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2660,6 +2660,7 @@ F:	package/python-texttable/
 F:	package/python-validators/
 F:	package/python-webob/
 F:	package/python-websocket-client/
+F:	package/rnnoise/
 F:	package/sedutil/
 F:	package/tpm2-totp/
 F:	package/triggerhappy/
diff --git a/package/Config.in b/package/Config.in
index dac1fc568d..1c2063e15d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1559,6 +1559,7 @@ menu "Audio/Sound"
 	source "package/opus/Config.in"
 	source "package/opusfile/Config.in"
 	source "package/portaudio/Config.in"
+	source "package/rnnoise/Config.in"
 	source "package/sbc/Config.in"
 	source "package/spandsp/Config.in"
 	source "package/speex/Config.in"
diff --git a/package/rnnoise/0001-Fix-compilation-errors.patch b/package/rnnoise/0001-Fix-compilation-errors.patch
new file mode 100644
index 0000000000..bbe710012e
--- /dev/null
+++ b/package/rnnoise/0001-Fix-compilation-errors.patch
@@ -0,0 +1,147 @@
+From 372f7b4b76cde4ca1ec4605353dd17898a99de38 Mon Sep 17 00:00:00 2001
+From: "Timothy B. Terriberry" <tterribe@xiph.org>
+Date: Mon, 15 Apr 2024 11:27:25 -0700
+Subject: [PATCH] Fix compilation errors.
+
+vec_avx.h needs x86cpu.h, and x86cpu.h needs to detect SSE2 (or
+ greater) without the Opus macros.
+Also, nobody was defining OPUS_CLEAR (but several things were
+ including the non-existent os_support.h where it is defined in
+ libopus), so replace those calls with RNN_CLEAR and remove the
+ erroneous includes.
+Take the opportunity to hoist OPUS_GNUC_PREREQ to common.h, too,
+ since it is needed in multiple places now.
+
+Fixes GitHub #222
+
+Upstream: https://github.com/xiph/rnnoise/commit/372f7b4b76cde4ca1ec4605353dd17898a99de38
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/common.h     | 8 ++++++++
+ src/vec.h        | 9 ++++-----
+ src/vec_avx.h    | 2 +-
+ src/vec_neon.h   | 5 +++--
+ src/x86/x86cpu.h | 4 ++--
+ 5 files changed, 18 insertions(+), 10 deletions(-)
+
+diff --git a/src/common.h b/src/common.h
+index 5005bff..f9095ca 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -43,6 +43,14 @@ static RNN_INLINE void rnnoise_free (void *ptr)
+ #define RNN_CLEAR(dst, n) (memset((dst), 0, (n)*sizeof(*(dst))))
+ #endif
+ 
++# if !defined(OPUS_GNUC_PREREQ)
++#  if defined(__GNUC__)&&defined(__GNUC_MINOR__)
++#   define OPUS_GNUC_PREREQ(_maj,_min) \
++ ((__GNUC__<<16)+__GNUC_MINOR__>=((_maj)<<16)+(_min))
++#  else
++#   define OPUS_GNUC_PREREQ(_maj,_min) 0
++#  endif
++# endif
+ 
+ 
+ #endif
+diff --git a/src/vec.h b/src/vec.h
+index 8e96cbf..71b7afb 100644
+--- a/src/vec.h
++++ b/src/vec.h
+@@ -30,6 +30,7 @@
+ #define VEC_H
+ 
+ #include "opus_types.h"
++#include "common.h"
+ #include <math.h>
+ #include "arch.h"
+ #include "x86/x86_arch_macros.h"
+@@ -41,8 +42,6 @@
+ #include "vec_neon.h"
+ #else
+ 
+-#include "os_support.h"
+-
+ #define MAX_INPUTS (2048)
+ 
+ #define NO_OPTIMIZATIONS
+@@ -50,7 +49,7 @@
+ static inline void sgemv16x1(float *out, const float *weights, int rows, int cols, int col_stride, const float *x)
+ {
+    int i, j;
+-   OPUS_CLEAR(out, rows);
++   RNN_CLEAR(out, rows);
+    for (i=0;i<rows;i+=16)
+    {
+       for (j=0;j<cols;j++)
+@@ -84,7 +83,7 @@ static inline void sgemv16x1(float *out, const float *weights, int rows, int col
+ static inline void sgemv8x1(float *out, const float *weights, int rows, int cols, int col_stride, const float *x)
+ {
+    int i, j;
+-   OPUS_CLEAR(out, rows);
++   RNN_CLEAR(out, rows);
+    for (i=0;i<rows;i+=8)
+    {
+       for (j=0;j<cols;j++)
+@@ -124,7 +123,7 @@ static inline void sgemv(float *out, const float *weights, int rows, int cols, i
+ static inline void sparse_sgemv8x4(float *out, const float *w, const int *idx, int rows, const float *x)
+ {
+    int i, j;
+-   OPUS_CLEAR(out, rows);
++   RNN_CLEAR(out, rows);
+    for (i=0;i<rows;i+=8)
+    {
+       int cols;
+diff --git a/src/vec_avx.h b/src/vec_avx.h
+index b73a353..a5040b4 100644
+--- a/src/vec_avx.h
++++ b/src/vec_avx.h
+@@ -34,7 +34,7 @@
+ 
+ #include <immintrin.h>
+ #include <math.h>
+-/*#include "celt/x86/x86cpu.h"*/
++#include "x86/x86cpu.h"
+ 
+ #define MAX_INPUTS (2048)
+ 
+diff --git a/src/vec_neon.h b/src/vec_neon.h
+index e6432e2..31b736c 100644
+--- a/src/vec_neon.h
++++ b/src/vec_neon.h
+@@ -32,7 +32,8 @@
+ #define VEC_NEON_H
+ 
+ #include <arm_neon.h>
+-#include "os_support.h"
++#include "opus_types.h"
++#include "common.h"
+ 
+ #if defined(__arm__) && !defined(__aarch64__) && (__ARM_ARCH < 8 || !defined(__clang__))
+ /* Emulate vcvtnq_s32_f32() for ARMv7 Neon. */
+@@ -302,7 +303,7 @@ static inline void sgemv(float *out, const float *weights, int rows, int cols, i
+ static inline void sparse_sgemv8x4(float *out, const float *w, const int *idx, int rows, const float *x)
+ {
+    int i, j;
+-   OPUS_CLEAR(out, rows);
++   RNN_CLEAR(out, rows);
+    for (i=0;i<rows;i+=8)
+    {
+       int cols;
+diff --git a/src/x86/x86cpu.h b/src/x86/x86cpu.h
+index 97dcdbd..e214aba 100644
+--- a/src/x86/x86cpu.h
++++ b/src/x86/x86cpu.h
+@@ -36,8 +36,8 @@
+ int opus_select_arch(void);
+ # endif
+ 
+-# if defined(OPUS_X86_MAY_HAVE_SSE2)
+-#  include "opus_defines.h"
++# if defined(__SSE2__)
++#  include "common.h"
+ 
+ /*MOVD should not impose any alignment restrictions, but the C standard does,
+    and UBSan will report errors if we actually make unaligned accesses.
+-- 
+2.39.5
+
diff --git a/package/rnnoise/Config.in b/package/rnnoise/Config.in
new file mode 100644
index 0000000000..25bcc60d12
--- /dev/null
+++ b/package/rnnoise/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RNNOISE
+	bool "rnnoise"
+	help
+	  RNNoise is a noise suppression library based on a recurrent
+	  neural network.
+
+	  https://github.com/xiph/rnnoise/
diff --git a/package/rnnoise/rnnoise.hash b/package/rnnoise/rnnoise.hash
new file mode 100644
index 0000000000..cbf3a9451e
--- /dev/null
+++ b/package/rnnoise/rnnoise.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  90fce4b00b9ff24c08dbfe31b82ffd43bae383d85c5535676d28b0a2b11c0d37  rnnoise-0.2.tar.gz
+sha256  45d37ca1cdb278c088e1aa85e0e65ca3a534ed86a28dcc96ca16810248a61d35  COPYING
diff --git a/package/rnnoise/rnnoise.mk b/package/rnnoise/rnnoise.mk
new file mode 100644
index 0000000000..a8b74f5650
--- /dev/null
+++ b/package/rnnoise/rnnoise.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# rnnoise
+#
+################################################################################
+
+RNNOISE_VERSION = 0.2
+RNNOISE_SITE = https://github.com/xiph/rnnoise/releases/download/v$(RNNOISE_VERSION)
+RNNOISE_LICENSE = BSD-3-Clause
+RNNOISE_LICENSE_FILES = COPYING
+RNNOISE_INSTALL_STAGING = YES
+
+RNNOISE_CONF_OPTS = --disable-doc --disable-examples
+
+$(eval $(autotools-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
