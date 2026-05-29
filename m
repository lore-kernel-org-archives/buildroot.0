Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8824CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F4986132B;
	Fri, 29 May 2026 08:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05jhg21zOaDh; Fri, 29 May 2026 08:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D7266136C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043295;
	bh=KcutEqOeIGtt2gEd0JIuwXLp8BiQ6TLVQTSUj2vsQEE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DjVHy7mnngHmfEHfecFcuiFywzKF28Y4C5Qrqqqw9UeL6OLSVZnOIijPPAi63BbSq
	 4VHackn8LZxpIAf2vI6lgoQXKsqxXvRD+JgKCmJ4XH8Zn3gazTFS5LubcG5rFJhbrj
	 dnXsLH3O4+USyxZf6HukuSmBB0VSHs7AjHiuamDP4kUZasWZY5q+9A9etASohYqtCm
	 b7wh901x6etQjjp3GBRyWlYxrYRnh2+kI8KjGeYAq2Rne6aBwe31Yl+8RqKh8K0ouH
	 Iq+pOcnNQftBGLefaF1DueKwql2lDmDbu+Ued1G6B+u9VpVGGn/QBGT8+vMBe+sELr
	 +mj4FTPpO3xyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D7266136C;
	Fri, 29 May 2026 08:28:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1942C288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 306F760D93
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KASUZy0PzwKF for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B21026136C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B21026136C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F29E87099; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:12 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 66127b61bb7e226e2ea55371572875a8dd7fab12
X-Git-Newrev: 33ec270f8a4235ae76d99d8c5ae1634eef47a98b
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.4F29E87099@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libnss: fix
 Makefile ifndef FREEBL_NO_DEPEND
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/33ec270f8a4235ae76d99d8c5ae1634eef47a98b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

NSS Makefile build system is pretty weak if used with parallel build. In
this case what happens is that 'ifndef FREEBL_NO_DEPEND' appears in
lib/freebl/manifest.mn and coreconf/Linux.mk. When parallel building
variable FREEBL_NO_DEPEND gets defined if not defined to 1, but in the
2 occurences we end up having on variable set to 1 and 1 still not
defined. This results in:
`
/home/giuliobenetti/br-reproduce/3e046c996825447f48377f7c4361b5db26b84f95/output/host/lib/gcc/arm-buildroot-linux-musleabi/14.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: Linux2.6_arm_arm-buildroot-linux-musleabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash_vector.o: in function `loader_GetOriginalPathname':
lowhash_vector.c:(.text.loader_GetOriginalPathname+0x68): undefined reference to `PR_SetError'
collect2: error: ld returned 1 exit status
`
So let's pass FREEBL_NO_DEPEND=1 when building to define that variable
instead to let NSS Makefile to calculate it.

Fixes:
https://autobuild.buildroot.net/results/ad4/ad40536728303c56d1d0968e38ac36da12cca416//

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 6d3cc38ec03835baca81ae971e02d3a5b72d546f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libnss/libnss.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index b1e10749c4..c7354290b1 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -57,7 +57,8 @@ LIBNSS_BUILD_VARS = \
 	OS_ARCH="Linux" \
 	OS_RELEASE="2.6" \
 	OS_TEST=$(BR2_PACKAGE_LIBNSS_ARCH) \
-	NSS_ENABLE_WERROR=0
+	NSS_ENABLE_WERROR=0 \
+	FREEBL_NO_DEPEND=1
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
 # Disable Altivec if not supported
@@ -136,7 +137,8 @@ HOST_LIBNSS_BUILD_VARS = \
 	NSS_USE_SYSTEM_SQLITE=1 \
 	SQLITE_INCLUDE_DIR=$(HOST_DIR)/include \
 	ZLIB_INCLUDE_DIR=$(HOST_DIR)/include \
-	NSS_ENABLE_WERROR=0
+	NSS_ENABLE_WERROR=0 \
+	FREEBL_NO_DEPEND=1
 
 HOST_LIBNSS_DEPENDENCIES = host-libnspr host-sqlite host-zlib
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
