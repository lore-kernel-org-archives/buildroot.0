Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6F1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:27:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBA7261037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBA7261037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C30B414A0;
	Tue,  3 Aug 2021 23:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vy0_gE8Zm-6d; Tue,  3 Aug 2021 23:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE58E4066E;
	Tue,  3 Aug 2021 23:27:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0651F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7757C40E9D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sljGTnaNP5aD for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9397340E54
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E915587F55; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jul 2021 21:42:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5633f2fb7a5e733d2900aa5a372b4de88ef767c1
X-Git-Newrev: 1f77fce9664b9bc866bc4d4dd47eb03a00e630be
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.E915587F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sbc: bump to version
 1.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5326990729087378085=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============5326990729087378085==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1f77fce9664b9bc866bc4d4dd47eb03a00e630be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We need to backport a commit to fix a build failure on non-x86.

Also update hash file formatting (2 spaces)

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-sbc_primitives-Fix-build-on-non-x86.patch | 49 ++++++++++++++++++++++
 package/sbc/sbc.hash                               |  6 +--
 package/sbc/sbc.mk                                 |  2 +-
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/package/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch b/package/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
new file mode 100644
index 0000000000..3ed73ebd88
--- /dev/null
+++ b/package/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
@@ -0,0 +1,49 @@
+From 909a9bdf7ab143e1f0baaf9736baebd3cd79aacf Mon Sep 17 00:00:00 2001
+From: Marius Bakke <marius@gnu.org>
+Date: Tue, 22 Dec 2020 11:04:26 +0000
+Subject: [PATCH] sbc_primitives: Fix build on non-x86.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Don't call __builtin_cpu_init unless targeting i386 or x86_64.
+Otherwise we get an error at link time:
+
+  CC       sbc/sbc_primitives.lo
+sbc/sbc_primitives.c: In function ‘sbc_init_primitives_x86’:
+sbc/sbc_primitives.c:596:2: warning: implicit declaration of function ‘__builtin_cpu_init’; did you mean ‘__builtin_irint’? [-Wimplicit-function-declaration]
+[...]
+  CCLD     src/sbcdec
+ld: sbc/.libs/libsbc-private.a(sbc_primitives.o): in function `sbc_init_primitives':
+sbc_primitives.c:(.text+0x3a30): undefined reference to `__builtin_cpu_init'
+
+Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
+[Upstream status: backport from upstream commit 909a9bdf7ab143e1f0baaf9736baebd3cd79aacf]
+
+---
+ sbc/sbc_primitives.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sbc/sbc_primitives.c b/sbc/sbc_primitives.c
+index 97a75be..09c214a 100644
+--- a/sbc/sbc_primitives.c
++++ b/sbc/sbc_primitives.c
+@@ -593,6 +593,7 @@ static int sbc_calc_scalefactors_j(
+ 
+ static void sbc_init_primitives_x86(struct sbc_encoder_state *state)
+ {
++#if defined(__x86_64__) || defined(__i386__)
+ 	__builtin_cpu_init();
+ 
+ #ifdef SBC_BUILD_WITH_MMX_SUPPORT
+@@ -604,6 +605,7 @@ static void sbc_init_primitives_x86(struct sbc_encoder_state *state)
+ 	if (__builtin_cpu_supports("sse4.2"))
+ 		sbc_init_primitives_sse(state);
+ #endif
++#endif
+ }
+ 
+ /*
+-- 
+2.17.1
+
diff --git a/package/sbc/sbc.hash b/package/sbc/sbc.hash
index d703f23437..beb3b232a8 100644
--- a/package/sbc/sbc.hash
+++ b/package/sbc/sbc.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
-sha256	518bf46e6bb3dc808a95e1eabad26fdebe8a099c1e781c27ed7fca6c2f4a54c9	sbc-1.4.tar.xz
+sha256  0cbad69823a99e8421fe0700e8cf9eeb8fa0c1ad28e8dbc2182b3353507931d2  sbc-1.5.tar.xz
 
 # sha256 locally computed
-sha256	b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259	COPYING
-sha256	ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5	COPYING.LIB
+sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
+sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index 73e4aceb85..af5cf291a3 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SBC_VERSION = 1.4
+SBC_VERSION = 1.5
 SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
 SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 SBC_INSTALL_STAGING = YES

--===============5326990729087378085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============5326990729087378085==--
