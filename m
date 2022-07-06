Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2173DC43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6F368328E;
	Wed,  6 Jul 2022 21:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6F368328E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqT1cNuWlIwK; Wed,  6 Jul 2022 21:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925688302F;
	Wed,  6 Jul 2022 21:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925688302F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA8801BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9303960E0A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9303960E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6n9GMk4udpZE for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:34:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ECF2606A0
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ECF2606A0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BADEE82D9A; Wed,  6 Jul 2022 21:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:32:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: affabe47a22769b717979f854a1028e567d35e36
X-Git-Newrev: 05f559baccb2c34f73a17ecc831f7f0429a22dd1
X-Patchwork-Hint: ignore
Message-Id: <20220706212129.BADEE82D9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sbc: bump to version 2.0
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1037072642570530071=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1037072642570530071==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=05f559baccb2c34f73a17ecc831f7f0429a22dd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://git.kernel.org/pub/scm/bluetooth/sbc.git/tree/ChangeLog?h=2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-sbc_primitives-Fix-build-on-non-x86.patch | 49 ----------------------
 package/sbc/sbc.hash                               |  2 +-
 package/sbc/sbc.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/package/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch b/package/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
deleted file mode 100644
index 3ed73ebd88..0000000000
--- a/package/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 909a9bdf7ab143e1f0baaf9736baebd3cd79aacf Mon Sep 17 00:00:00 2001
-From: Marius Bakke <marius@gnu.org>
-Date: Tue, 22 Dec 2020 11:04:26 +0000
-Subject: [PATCH] sbc_primitives: Fix build on non-x86.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Don't call __builtin_cpu_init unless targeting i386 or x86_64.
-Otherwise we get an error at link time:
-
-  CC       sbc/sbc_primitives.lo
-sbc/sbc_primitives.c: In function ‘sbc_init_primitives_x86’:
-sbc/sbc_primitives.c:596:2: warning: implicit declaration of function ‘__builtin_cpu_init’; did you mean ‘__builtin_irint’? [-Wimplicit-function-declaration]
-[...]
-  CCLD     src/sbcdec
-ld: sbc/.libs/libsbc-private.a(sbc_primitives.o): in function `sbc_init_primitives':
-sbc_primitives.c:(.text+0x3a30): undefined reference to `__builtin_cpu_init'
-
-Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
-[Upstream status: backport from upstream commit 909a9bdf7ab143e1f0baaf9736baebd3cd79aacf]
-
----
- sbc/sbc_primitives.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sbc/sbc_primitives.c b/sbc/sbc_primitives.c
-index 97a75be..09c214a 100644
---- a/sbc/sbc_primitives.c
-+++ b/sbc/sbc_primitives.c
-@@ -593,6 +593,7 @@ static int sbc_calc_scalefactors_j(
- 
- static void sbc_init_primitives_x86(struct sbc_encoder_state *state)
- {
-+#if defined(__x86_64__) || defined(__i386__)
- 	__builtin_cpu_init();
- 
- #ifdef SBC_BUILD_WITH_MMX_SUPPORT
-@@ -604,6 +605,7 @@ static void sbc_init_primitives_x86(struct sbc_encoder_state *state)
- 	if (__builtin_cpu_supports("sse4.2"))
- 		sbc_init_primitives_sse(state);
- #endif
-+#endif
- }
- 
- /*
--- 
-2.17.1
-
diff --git a/package/sbc/sbc.hash b/package/sbc/sbc.hash
index beb3b232a8..b080c06205 100644
--- a/package/sbc/sbc.hash
+++ b/package/sbc/sbc.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
-sha256  0cbad69823a99e8421fe0700e8cf9eeb8fa0c1ad28e8dbc2182b3353507931d2  sbc-1.5.tar.xz
+sha256  8f12368e1dbbf55e14536520473cfb338c84b392939cc9b64298360fd4a07992  sbc-2.0.tar.xz
 
 # sha256 locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index af5cf291a3..744ce5f895 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SBC_VERSION = 1.5
+SBC_VERSION = 2.0
 SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
 SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 SBC_INSTALL_STAGING = YES

--===============1037072642570530071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1037072642570530071==--
