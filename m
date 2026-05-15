Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EF3CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 15:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF77B615CB;
	Fri, 15 May 2026 15:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTv6i-CG8FWX; Fri, 15 May 2026 15:11:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34129615C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778857879;
	bh=jb9Brlxka5CADOrfiewNKA6su7c+t3QtWZXH/smL07I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I5zKStL1YjS2Lzl1mNv62v9rAVo9008f9WCZi38whgPTO6gGhC9s0Oncx3tvnhY+2
	 J2yoPLdZCpMiWEf0iRhe7h8Q41WSK9ICNB9DjQKaDV1RC99YxMlHRweS5aeUqLfNZa
	 s/5XIR96MnAqz/vw1rHhuq5s7Q+NKwRcArvRlnz2kY9tk+XHGAWV2Ca/iFWkMHnWD2
	 9hbGJe/zKA47820b4LnUBFQrFEOaiOi/2DtoDlF29kQlLKSLqUb0MutuBYh/Xw067w
	 W/NZLh6isYl6/pDdClH2vBPpwm3mZSiwo9n0wQnmp2QwhU/8BOw3XnkQouBIU1cEOI
	 PbSLIcEfu+LhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34129615C4;
	Fri, 15 May 2026 15:11:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A25336F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 15:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F71B41B9B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 15:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBs1oAXc8VtO for <buildroot@buildroot.org>;
 Fri, 15 May 2026 15:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA8A4168D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BA8A4168D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 15:11:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 877F48637A; Fri, 15 May 2026 15:11:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:58:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89609ad586bc8ff387899c2733e668e7f96973f6
X-Git-Newrev: 6d3cc38ec03835baca81ae971e02d3a5b72d546f
X-Patchwork-Hint: ignore
Message-Id: <20260515151110.877F48637A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: fix Makefile ifndef
 FREEBL_NO_DEPEND
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d3cc38ec03835baca81ae971e02d3a5b72d546f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/libnss/libnss.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 29b15d8a16..3426995368 100644
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
