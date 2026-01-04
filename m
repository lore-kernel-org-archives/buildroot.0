Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0883C2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7741606E2;
	Sun,  4 Jan 2026 10:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgaFnT7NwP1S; Sun,  4 Jan 2026 10:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B92B8606F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767523734;
	bh=keRA+hSYwWe48CxK/AS2cMD2pdVjnIdi6dMY21Fl4kY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zid8wMgVBNGxKPqAZM9YwROJLrNJPTdleR5UncNFzAmkQ2oiQX7FEqsBonHw8UKcS
	 4xipAFmMwBsWOlF5KgCgkLgIS4jhGYJt/cI+IdHS6RMQVxjngRx8LnMmG4TEvePKGq
	 OeKXAV6MgiL2rcG1+kATrGe+uvzZgJeZPSfxR31hIccq2QmT9HfxJstcvSl2JpTPw8
	 H+RNaTJtWf8GsuHz2Ruewsw9Vhv8OLYfML4MCIORCBOV8qvA8HHzjGCfrLm23meEYr
	 vDEdpE10KhrWeK6CUpCEhSiCbl2n3zUPbTj6UV3ePs48JbEVyofEOUBTMPQtt99XMu
	 ZlxnF1akbDSRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92B8606F0;
	Sun,  4 Jan 2026 10:48:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E7B22DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3091080D25
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wWYph3jTJWV for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5113B80D07
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5113B80D07
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F0FC881CE; Sun,  4 Jan 2026 10:48:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 11:48:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f1c2b9d693b2d54151d6b72ea55d7f55a8fdaa7
X-Git-Newrev: 9e779d6e57add2e1a78addb02ab45fbdd6a457e0
X-Patchwork-Hint: ignore
Message-Id: <20260104104852.3F0FC881CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opus: bump version to 1.6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1621254361558595707=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1621254361558595707==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9e779d6e57add2e1a78addb02ab45fbdd6a457e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://opus-codec.org/release/stable/2025/12/15/libopus-1_6.html

opus 1.6 introduced optimization for Arm using Neon intrinsics.
Those are not available in soft-float ABI. This commit disables the
usage of intrinsics in that case.

This commit also adds an upstream patch to the libopusenc package.
It is because libopusenc is using internal functions of opus, which
were renamed in upstream commit [1]. Without this patch, the
opus-tools package fail to compile with error:

    src/opusenc.c: In function ‘main’:
    /.../sysroot/usr/include/opus/opusenc.h:134:63: error: implicit declaration of function ‘__opus_check_int’; did you mean ‘opus_check_int’? [-Wimplicit-function-declaration]

[1] https://gitlab.xiph.org/xiph/opus/-/commit/7817df7908318fb3a0af2a01e4da1e25643967d0

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-opusenc.h-Avoid-__opus_check_-macros.patch | 85 ++++++++++++++++++++++
 package/opus/opus.hash                             |  2 +-
 package/opus/opus.mk                               |  8 +-
 3 files changed, 93 insertions(+), 2 deletions(-)

diff --git a/package/libopusenc/0001-opusenc.h-Avoid-__opus_check_-macros.patch b/package/libopusenc/0001-opusenc.h-Avoid-__opus_check_-macros.patch
new file mode 100644
index 0000000000..e8ab31f30a
--- /dev/null
+++ b/package/libopusenc/0001-opusenc.h-Avoid-__opus_check_-macros.patch
@@ -0,0 +1,85 @@
+From a0010e4602b40efc1413b3069122eb73efb688d3 Mon Sep 17 00:00:00 2001
+From: Mark Harris <mark.hsj@gmail.com>
+Date: Mon, 24 Nov 2025 11:52:29 -0800
+Subject: [PATCH] opusenc.h: Avoid __opus_check_* macros
+
+The __opus_check_* macros are undocumented macros internal to opus, and
+have changed in opus commit 7817df7908318fb3a0af2a01e4da1e25643967d0
+because identifiers beginning with a double underscore are reserved by
+ISO C.  Define our own macros, not using reserved identifiers.
+
+Reported by Bertaz on GitHub and benedikt-grl on gitlab.xiph.org.
+
+Resolves: https://github.com/xiph/libopusenc/pull/36
+Resolves: https://gitlab.xiph.org/xiph/opus-tools/-/issues/2323
+Upstream: https://gitlab.xiph.org/xiph/libopusenc/-/commit/04c6172ffbbd5c7f7f2e170cf843872113f33b05
+[Julien: rebase on v0.2.1]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ include/opusenc.h | 35 ++++++++++++++++++++---------------
+ 1 file changed, 20 insertions(+), 15 deletions(-)
+
+diff --git a/include/opusenc.h b/include/opusenc.h
+index 50ba8b5..6a893c7 100644
+--- a/include/opusenc.h
++++ b/include/opusenc.h
+@@ -104,7 +104,6 @@ extern "C" {
+ /*@}*/
+ /*@}*/
+ 
+-
+ /* These are the "raw" request values -- they should usually not be used. */
+ #define OPE_SET_DECISION_DELAY_REQUEST      14000
+ #define OPE_GET_DECISION_DELAY_REQUEST      14001
+@@ -121,6 +120,13 @@ extern "C" {
+ #define OPE_GET_NB_STREAMS_REQUEST          14013
+ #define OPE_GET_NB_COUPLED_STREAMS_REQUEST  14015
+ 
++/* Macros to trigger compilation errors when the wrong types are provided to a CTL. */
++/* These macros are not part of the API and are only for use within the macros below. */
++#define ope_check_int(x) (((void)((x) == (opus_int32)0)), (opus_int32)(x))
++#define ope_check_int_ptr(ptr) ((ptr) + ((ptr) - (opus_int32*)(ptr)))
++#define ope_check_packet_func(x) ((void)((void (*)(void *, const unsigned char *, opus_int32, opus_uint32))0 == (x)), (x))
++#define ope_check_void_ptr(x) ((void)((void *)0 == (x)), (x))
++
+ /**\defgroup encoder_ctl Encoding Options*/
+ /*@{*/
+ 
+@@ -129,21 +135,20 @@ extern "C" {
+    Macros for setting encoder options.*/
+ /*@{*/
+ 
+-#define OPE_SET_DECISION_DELAY(x) OPE_SET_DECISION_DELAY_REQUEST, __opus_check_int(x)
+-#define OPE_GET_DECISION_DELAY(x) OPE_GET_DECISION_DELAY_REQUEST, __opus_check_int_ptr(x)
+-#define OPE_SET_MUXING_DELAY(x) OPE_SET_MUXING_DELAY_REQUEST, __opus_check_int(x)
+-#define OPE_GET_MUXING_DELAY(x) OPE_GET_MUXING_DELAY_REQUEST, __opus_check_int_ptr(x)
+-#define OPE_SET_COMMENT_PADDING(x) OPE_SET_COMMENT_PADDING_REQUEST, __opus_check_int(x)
+-#define OPE_GET_COMMENT_PADDING(x) OPE_GET_COMMENT_PADDING_REQUEST, __opus_check_int_ptr(x)
+-#define OPE_SET_SERIALNO(x) OPE_SET_SERIALNO_REQUEST, __opus_check_int(x)
+-#define OPE_GET_SERIALNO(x) OPE_GET_SERIALNO_REQUEST, __opus_check_int_ptr(x)
+-/* FIXME: Add type-checking macros to these. */
+-#define OPE_SET_PACKET_CALLBACK(x,u) OPE_SET_PACKET_CALLBACK_REQUEST, (x), (u)
++#define OPE_SET_DECISION_DELAY(x) OPE_SET_DECISION_DELAY_REQUEST, ope_check_int(x)
++#define OPE_GET_DECISION_DELAY(x) OPE_GET_DECISION_DELAY_REQUEST, ope_check_int_ptr(x)
++#define OPE_SET_MUXING_DELAY(x) OPE_SET_MUXING_DELAY_REQUEST, ope_check_int(x)
++#define OPE_GET_MUXING_DELAY(x) OPE_GET_MUXING_DELAY_REQUEST, ope_check_int_ptr(x)
++#define OPE_SET_COMMENT_PADDING(x) OPE_SET_COMMENT_PADDING_REQUEST, ope_check_int(x)
++#define OPE_GET_COMMENT_PADDING(x) OPE_GET_COMMENT_PADDING_REQUEST, ope_check_int_ptr(x)
++#define OPE_SET_SERIALNO(x) OPE_SET_SERIALNO_REQUEST, ope_check_int(x)
++#define OPE_GET_SERIALNO(x) OPE_GET_SERIALNO_REQUEST, ope_check_int_ptr(x)
++#define OPE_SET_PACKET_CALLBACK(x,u) OPE_SET_PACKET_CALLBACK_REQUEST, ope_check_packet_func(x), ope_check_void_ptr(u)
+ /*#define OPE_GET_PACKET_CALLBACK(x,u) OPE_GET_PACKET_CALLBACK_REQUEST, (x), (u)*/
+-#define OPE_SET_HEADER_GAIN(x) OPE_SET_HEADER_GAIN_REQUEST, __opus_check_int(x)
+-#define OPE_GET_HEADER_GAIN(x) OPE_GET_HEADER_GAIN_REQUEST, __opus_check_int_ptr(x)
+-#define OPE_GET_NB_STREAMS(x) OPE_GET_NB_STREAMS_REQUEST, __opus_check_int_ptr(x)
+-#define OPE_GET_NB_COUPLED_STREAMS(x) OPE_GET_NB_COUPLED_STREAMS_REQUEST, __opus_check_int_ptr(x)
++#define OPE_SET_HEADER_GAIN(x) OPE_SET_HEADER_GAIN_REQUEST, ope_check_int(x)
++#define OPE_GET_HEADER_GAIN(x) OPE_GET_HEADER_GAIN_REQUEST, ope_check_int_ptr(x)
++#define OPE_GET_NB_STREAMS(x) OPE_GET_NB_STREAMS_REQUEST, ope_check_int_ptr(x)
++#define OPE_GET_NB_COUPLED_STREAMS(x) OPE_GET_NB_COUPLED_STREAMS_REQUEST, ope_check_int_ptr(x)
+ /*@}*/
+ /*@}*/
+ 
+-- 
+2.52.0
+
diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index ef0226281d..675117e518 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256  65c1d2f78b9f2fb20082c38cbe47c951ad5839345876e46941612ee87f9a7ce1  opus-1.5.2.tar.gz
+sha256  b7637334527201fdfd6dd6a02e67aceffb0e5e60155bbd89175647a80301c92c  opus-1.6.tar.gz
 
 # Hash for license file
 sha256  01e1167d54a096d123cf6dfbbeb19587278845c6481d2d66d545669846079551  COPYING
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 1d3133bb58..98ca12a623 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.5.2
+OPUS_VERSION = 1.6
 OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
@@ -41,4 +41,10 @@ ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_ARM_CPU_HAS_ARM),y:)
 OPUS_CONF_OPTS += --disable-asm
 endif
 
+# We also disable assembly in case we have a soft-float ABI (opus has
+# NEON instructions which are not available in that case).
+ifeq ($(BR2_ARM_SOFT_FLOAT),y)
+OPUS_CONF_OPTS += --disable-intrinsics
+endif
+
 $(eval $(autotools-package))

--===============1621254361558595707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1621254361558595707==--
