Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4F1D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2484F408F3;
	Thu, 22 Jan 2026 19:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huJMH_oKbpsC; Thu, 22 Jan 2026 19:09:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 112D0408F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769108957;
	bh=pOFCzCImkpVTS/NSTqOW3gFdcaBEK+sEis9fyWwVEFs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qpgmZjO1sJNTFk2RbAhmzGa+lV+8k9QDG5hLag3gkSKmAN+HLacPyE6ENsQQRCpHj
	 gY8o2B7HBZbJsRFjWVRQtIr2wSAypGaKPNWQ7WmlUpeQMll/FRGao6QkhEPp9ud8qR
	 YxnVlg/Nq3IPEPJhypDJovlPLqUOD9PFQwyy+RB41UFT2FmGmwP0trZuRJL9yLVUw6
	 YOU67fpSQHMyKlyI/fMdlgVB1fW21j/VPSY99ibLRI5jn1wL/B/yZ3E7qq8KzEMneb
	 eHFhtkFewLZFij6EYiE63pfoaKUlVrYOK7x+3Dr5vOsetMt6aEt+E1xkszX4TEPb5g
	 pKmDeDFppX6CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 112D0408F4;
	Thu, 22 Jan 2026 19:09:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79A68122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69C8F8083A
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwAmhUfhTgLE for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:09:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F31D80794
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F31D80794
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B1548751C; Thu, 22 Jan 2026 19:09:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:08:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18de297a5ad3d1fc1b44f54ae69289ca10200ad5
X-Git-Newrev: 72e4853bc7b8eca31df91887d8b97e2a311df6f9
X-Patchwork-Hint: ignore
Message-Id: <20260122190914.6B1548751C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopusenc: bump version to 0.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=72e4853bc7b8eca31df91887d8b97e2a311df6f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://opus-codec.org/release/dev/2026/01/03/libopusenc-0_3.html

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-opusenc.h-Avoid-__opus_check_-macros.patch | 85 ----------------------
 package/libopusenc/libopusenc.hash                 |  5 +-
 package/libopusenc/libopusenc.mk                   |  2 +-
 3 files changed, 4 insertions(+), 88 deletions(-)

diff --git a/package/libopusenc/0001-opusenc.h-Avoid-__opus_check_-macros.patch b/package/libopusenc/0001-opusenc.h-Avoid-__opus_check_-macros.patch
deleted file mode 100644
index e8ab31f30a..0000000000
--- a/package/libopusenc/0001-opusenc.h-Avoid-__opus_check_-macros.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From a0010e4602b40efc1413b3069122eb73efb688d3 Mon Sep 17 00:00:00 2001
-From: Mark Harris <mark.hsj@gmail.com>
-Date: Mon, 24 Nov 2025 11:52:29 -0800
-Subject: [PATCH] opusenc.h: Avoid __opus_check_* macros
-
-The __opus_check_* macros are undocumented macros internal to opus, and
-have changed in opus commit 7817df7908318fb3a0af2a01e4da1e25643967d0
-because identifiers beginning with a double underscore are reserved by
-ISO C.  Define our own macros, not using reserved identifiers.
-
-Reported by Bertaz on GitHub and benedikt-grl on gitlab.xiph.org.
-
-Resolves: https://github.com/xiph/libopusenc/pull/36
-Resolves: https://gitlab.xiph.org/xiph/opus-tools/-/issues/2323
-Upstream: https://gitlab.xiph.org/xiph/libopusenc/-/commit/04c6172ffbbd5c7f7f2e170cf843872113f33b05
-[Julien: rebase on v0.2.1]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- include/opusenc.h | 35 ++++++++++++++++++++---------------
- 1 file changed, 20 insertions(+), 15 deletions(-)
-
-diff --git a/include/opusenc.h b/include/opusenc.h
-index 50ba8b5..6a893c7 100644
---- a/include/opusenc.h
-+++ b/include/opusenc.h
-@@ -104,7 +104,6 @@ extern "C" {
- /*@}*/
- /*@}*/
- 
--
- /* These are the "raw" request values -- they should usually not be used. */
- #define OPE_SET_DECISION_DELAY_REQUEST      14000
- #define OPE_GET_DECISION_DELAY_REQUEST      14001
-@@ -121,6 +120,13 @@ extern "C" {
- #define OPE_GET_NB_STREAMS_REQUEST          14013
- #define OPE_GET_NB_COUPLED_STREAMS_REQUEST  14015
- 
-+/* Macros to trigger compilation errors when the wrong types are provided to a CTL. */
-+/* These macros are not part of the API and are only for use within the macros below. */
-+#define ope_check_int(x) (((void)((x) == (opus_int32)0)), (opus_int32)(x))
-+#define ope_check_int_ptr(ptr) ((ptr) + ((ptr) - (opus_int32*)(ptr)))
-+#define ope_check_packet_func(x) ((void)((void (*)(void *, const unsigned char *, opus_int32, opus_uint32))0 == (x)), (x))
-+#define ope_check_void_ptr(x) ((void)((void *)0 == (x)), (x))
-+
- /**\defgroup encoder_ctl Encoding Options*/
- /*@{*/
- 
-@@ -129,21 +135,20 @@ extern "C" {
-    Macros for setting encoder options.*/
- /*@{*/
- 
--#define OPE_SET_DECISION_DELAY(x) OPE_SET_DECISION_DELAY_REQUEST, __opus_check_int(x)
--#define OPE_GET_DECISION_DELAY(x) OPE_GET_DECISION_DELAY_REQUEST, __opus_check_int_ptr(x)
--#define OPE_SET_MUXING_DELAY(x) OPE_SET_MUXING_DELAY_REQUEST, __opus_check_int(x)
--#define OPE_GET_MUXING_DELAY(x) OPE_GET_MUXING_DELAY_REQUEST, __opus_check_int_ptr(x)
--#define OPE_SET_COMMENT_PADDING(x) OPE_SET_COMMENT_PADDING_REQUEST, __opus_check_int(x)
--#define OPE_GET_COMMENT_PADDING(x) OPE_GET_COMMENT_PADDING_REQUEST, __opus_check_int_ptr(x)
--#define OPE_SET_SERIALNO(x) OPE_SET_SERIALNO_REQUEST, __opus_check_int(x)
--#define OPE_GET_SERIALNO(x) OPE_GET_SERIALNO_REQUEST, __opus_check_int_ptr(x)
--/* FIXME: Add type-checking macros to these. */
--#define OPE_SET_PACKET_CALLBACK(x,u) OPE_SET_PACKET_CALLBACK_REQUEST, (x), (u)
-+#define OPE_SET_DECISION_DELAY(x) OPE_SET_DECISION_DELAY_REQUEST, ope_check_int(x)
-+#define OPE_GET_DECISION_DELAY(x) OPE_GET_DECISION_DELAY_REQUEST, ope_check_int_ptr(x)
-+#define OPE_SET_MUXING_DELAY(x) OPE_SET_MUXING_DELAY_REQUEST, ope_check_int(x)
-+#define OPE_GET_MUXING_DELAY(x) OPE_GET_MUXING_DELAY_REQUEST, ope_check_int_ptr(x)
-+#define OPE_SET_COMMENT_PADDING(x) OPE_SET_COMMENT_PADDING_REQUEST, ope_check_int(x)
-+#define OPE_GET_COMMENT_PADDING(x) OPE_GET_COMMENT_PADDING_REQUEST, ope_check_int_ptr(x)
-+#define OPE_SET_SERIALNO(x) OPE_SET_SERIALNO_REQUEST, ope_check_int(x)
-+#define OPE_GET_SERIALNO(x) OPE_GET_SERIALNO_REQUEST, ope_check_int_ptr(x)
-+#define OPE_SET_PACKET_CALLBACK(x,u) OPE_SET_PACKET_CALLBACK_REQUEST, ope_check_packet_func(x), ope_check_void_ptr(u)
- /*#define OPE_GET_PACKET_CALLBACK(x,u) OPE_GET_PACKET_CALLBACK_REQUEST, (x), (u)*/
--#define OPE_SET_HEADER_GAIN(x) OPE_SET_HEADER_GAIN_REQUEST, __opus_check_int(x)
--#define OPE_GET_HEADER_GAIN(x) OPE_GET_HEADER_GAIN_REQUEST, __opus_check_int_ptr(x)
--#define OPE_GET_NB_STREAMS(x) OPE_GET_NB_STREAMS_REQUEST, __opus_check_int_ptr(x)
--#define OPE_GET_NB_COUPLED_STREAMS(x) OPE_GET_NB_COUPLED_STREAMS_REQUEST, __opus_check_int_ptr(x)
-+#define OPE_SET_HEADER_GAIN(x) OPE_SET_HEADER_GAIN_REQUEST, ope_check_int(x)
-+#define OPE_GET_HEADER_GAIN(x) OPE_GET_HEADER_GAIN_REQUEST, ope_check_int_ptr(x)
-+#define OPE_GET_NB_STREAMS(x) OPE_GET_NB_STREAMS_REQUEST, ope_check_int_ptr(x)
-+#define OPE_GET_NB_COUPLED_STREAMS(x) OPE_GET_NB_COUPLED_STREAMS_REQUEST, ope_check_int_ptr(x)
- /*@}*/
- /*@}*/
- 
--- 
-2.52.0
-
diff --git a/package/libopusenc/libopusenc.hash b/package/libopusenc/libopusenc.hash
index bdb4cf8fde..a39436b536 100644
--- a/package/libopusenc/libopusenc.hash
+++ b/package/libopusenc/libopusenc.hash
@@ -1,3 +1,4 @@
-# From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256  8298db61a8d3d63e41c1a80705baa8ce9ff3f50452ea7ec1c19a564fe106cbb9  libopusenc-0.2.1.tar.gz
+# From https://opus-codec.org/release/dev/2026/01/03/libopusenc-0_3.html
+sha256  f616d3aff9b2034547894ccb8ab56c36cf1a4acb0d922c5d7119f97bbe58642c  libopusenc-0.3.tar.gz
+# Locally computed
 sha256  93b17ab56b8230127fea532be0dcb4e6d71e66ab5e8ce5d6ae8785d7288b164f  COPYING
diff --git a/package/libopusenc/libopusenc.mk b/package/libopusenc/libopusenc.mk
index 3b4dc0e714..8606a49dde 100644
--- a/package/libopusenc/libopusenc.mk
+++ b/package/libopusenc/libopusenc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPUSENC_VERSION = 0.2.1
+LIBOPUSENC_VERSION = 0.3
 LIBOPUSENC_SITE = https://downloads.xiph.org/releases/opus
 LIBOPUSENC_LICENSE = BSD-3-Clause
 LIBOPUSENC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
