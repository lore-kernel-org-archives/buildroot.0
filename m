Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EEEC4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2B3D40A74;
	Fri, 17 Jul 2026 15:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ys_cWehpbRra; Fri, 17 Jul 2026 15:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB68440A6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303072;
	bh=78LHRiHBpBUjOFb47nKB+OGT2kFT2Ofa773Bj51ebKU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UgXfO18T4uAZz02tyS8X/md51THIGlvL42WJBOjh9QwWW/VUsa4ddVT3eESlN2gEw
	 I1/DI53d9xNgQmA0LzjHhRxROmrSC87Ws8qgvmLCSjBwzkDz5xLJAwOOWd+sJlJkHR
	 1vAWFMUxHNpC+zMpotjMuUj7kpZ2OfknorIt4iXG0KFe08OnviW2FP+wN3WaJj5zFO
	 zYx+EsScNHJOMvX3CppBbQ/BFyZbHtSan93FdFyrJchKG9T9LLSLORdg/bdy4jlgKp
	 POPZpp/VwE/43hHwQlWbQ0suMzMQcYnUMH+g7Q7JFFY7eZjN90RHSXi6RU/doEcKBW
	 jSCVrDWrnVYiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB68440A6A;
	Fri, 17 Jul 2026 15:44:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E42E435
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 101286065E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PngkqXd4bRWJ for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F061060AC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F061060AC7
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0A6A88E53; Fri, 17 Jul 2026 15:43:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:05:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0923a07dfd94e123e46a3b2d523703a5f0627288
X-Git-Newrev: c03b63fe1ffe6bfb8a649f4187016e1d617de61f
X-Patchwork-Hint: ignore
Message-Id: <20260717154343.B0A6A88E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/x11r7/xwayland:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c03b63fe1ffe6bfb8a649f4187016e1d617de61f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 8ed1848cee..2853907c7f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1179,6 +1179,7 @@ package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-ser
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck lib_sysv.Variables
+package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch lib_patch.Upstream
 package/xen/0002-Fix-build-with-64-bits-time_t.patch lib_patch.Upstream
 package/xen/0003-libs-light-fix-tv_sec-printf-format.patch lib_patch.Upstream
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
