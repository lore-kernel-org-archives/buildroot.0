Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D6EC44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38EBA81141;
	Fri, 17 Jul 2026 15:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_M5iT9paAOK; Fri, 17 Jul 2026 15:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C93C8114A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303159;
	bh=j3cnFmigrS5R3quU4FjYHYc1zko9Z+Hkvo2CgJFIN6U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r4IZCTg1kE6it4A3KcMmoLMLzRHk/9KBT1edH/++qT8rRgWVXdJWK077cdo6FR4GO
	 qmB/yXsSDbAnOPj4LXMraT1jDbRDQjTWuJ09X/FWSCsxAkRaSdhmhch5GcLS0/ompP
	 W5Scc7LqZm2f6B1fMXmMsI/xfv73X30dOUdSgRRc9tIQsLu97O9EdN3HrSMEEIImTW
	 yRimW2SIMr0LQCmikufOwpUHYtt4+KJwCQZGpiST6EmBTvmuODBNLI1vWH2uWx0LsK
	 GBOxlqFOkTiiyAoTuSHuyQApErNTslWmuIMGVrULImSSExZCA+c2lKG5XCHR1ahXhW
	 a8PCnk28RhETg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C93C8114A;
	Fri, 17 Jul 2026 15:45:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ACC036E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D18A40626
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLEICZGjMTH6 for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C16640A2F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C16640A2F
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD34688E54; Fri, 17 Jul 2026 15:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:06:11 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 1bf3cbd45d750ec3440bc8c7790e29a0eae4d1cc
X-Git-Newrev: 6ca41028c0e5ab89aee634d218795b5cd98151fa
X-Patchwork-Hint: ignore
Message-Id: <20260717154510.CD34688E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/x11r7/xwayland:
 fix uClibc build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ca41028c0e5ab89aee634d218795b5cd98151fa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Copy patch from xserver_xorg-server to fix build errors with uClibc.

Fixes:
https://autobuild.buildroot.net/results/c03/c03d57ad7ed3feac008091a38ea50bfccfa62b08/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4325c62d419f4223cfabed43a6d77c25f240e340)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  1 +
 .../0001-include-misc.h-fix-uClibc-build.patch     | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index d5195f2e32..c4a20ad391 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -973,6 +973,7 @@ package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Upstr
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck lib_sysv.Variables
+package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/xl2tp/xl2tpd lib_shellscript.TrailingSpace
 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch lib_patch.Upstream
 package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch lib_patch.Upstream
diff --git a/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch
new file mode 100644
index 0000000000..562aa79fbb
--- /dev/null
+++ b/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch
@@ -0,0 +1,31 @@
+From 2e8fca00f5bdb02f2f59aaa428d1e9d808ab0e86 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 16 Jun 2018 19:20:16 +0200
+Subject: [PATCH] include/misc.h: fix uClibc build
+
+A similar fix was used for Dovecot:
+https://www.dovecot.org/list/dovecot/2017-November/110019.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/misc.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/misc.h b/include/misc.h
+index 14920c3c3..390e52b60 100644
+--- a/include/misc.h
++++ b/include/misc.h
+@@ -185,6 +185,10 @@ typedef struct _xReq *xReqPtr;
+ #endif
+ #endif
+ 
++#undef bswap_16
++#undef bswap_32
++#undef bswap_64
++
+ /**
+  * Calculate the number of bytes needed to hold bits.
+  * @param bits The minimum number of bits needed.
+-- 
+2.17.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
