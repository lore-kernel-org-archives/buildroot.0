Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A9EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 21:10:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 650196108B
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 21:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 650196108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11DED81CA0;
	Thu, 11 Nov 2021 21:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKiLOm0wVeiQ; Thu, 11 Nov 2021 21:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA6E81BB0;
	Thu, 11 Nov 2021 21:10:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1F291BF388
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 21:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E4094052B
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 21:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wV6GUOfW-XVj for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 21:10:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D141440527
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 21:10:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AE3D688CC1; Thu, 11 Nov 2021 21:06:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 22:10:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f42504d6d55d9e667484ce4edd5a9a6de690ddc
X-Git-Newrev: e0c1ce019f8a5aaf9f54ae85e18821048b23d940
X-Patchwork-Hint: ignore
Message-Id: <20211111210644.AE3D688CC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] iperf: fix build with musl
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5402047290387276958=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5402047290387276958==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e0c1ce019f8a5aaf9f54ae85e18821048b23d940
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch changing headers include order to fix 'struct ethhdr'
conflict between kernel headers and musl libc.

Fixes:
http://autobuild.buildroot.net/results/23ada69f9b7dc4460315d9175d3064d8db182f8e/
http://autobuild.buildroot.net/results/3d9c9850de8da5b10bec4f25be07d9ecbc8e0931/
http://autobuild.buildroot.net/results/25116af770cf94227302cfc1cff4ded07e85fe49/

Cc: Matt Weber <matthew.weber@collins.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iperf/0001-Fix-build-with-musl-libc.patch | 67 +++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/iperf/0001-Fix-build-with-musl-libc.patch b/package/iperf/0001-Fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..269079ee1e
--- /dev/null
+++ b/package/iperf/0001-Fix-build-with-musl-libc.patch
@@ -0,0 +1,67 @@
+From 6766ab322a9eb8c73f8276be9cdea356eb124de0 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 11 Nov 2021 07:58:10 +0200
+Subject: [PATCH] Fix build with musl libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+musl libc defines its own struct ethhdr that conflicts with the kernel
+define one. The kernel headers provide a way to suppress its struct
+ethhdr. For that to work the libc headers must precede the kernel. Move
+the kernel linux/if_tun.h include below libc net/ethernet.h. That fixes
+the following build failure:
+
+In file included from .../arm-buildroot-linux-musleabihf/sysroot/usr/include/net/ethernet.h:10,
+                 from ../include/headers.h:117,
+                 from Thread.c:72:
+.../arm-buildroot-linux-musleabihf/sysroot/usr/include/netinet/if_ether.h:116:8: error: redefinition of ‘struct ethhdr’
+  116 | struct ethhdr {
+      |        ^~~~~~
+In file included from .../arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/if_tun.h:20,
+                 from ../include/headers.h:110,
+                 from Thread.c:72:
+.../arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/if_ether.h:148:8: note: originally defined here
+  148 | struct ethhdr {
+      |        ^~~~~~
+
+Fixes bug #157.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: sent to Robert McMahon <rjmcmahon@rjmcmahon.com>
+
+ include/headers.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/include/headers.h b/include/headers.h
+index 00e0ea0dba42..887490475381 100644
+--- a/include/headers.h
++++ b/include/headers.h
+@@ -106,11 +106,6 @@ typedef bool _Bool;
+ #include <net/if.h>
+ #endif
+ 
+-#if ((HAVE_TUNTAP_TAP) || (HAVE_TUNTAP_TUN))
+-#include <linux/if_tun.h>
+-#include <sys/ioctl.h>
+-#endif
+-
+ 
+ // AF_PACKET HEADERS
+ #if defined(HAVE_LINUX_FILTER_H) && defined(HAVE_AF_PACKET)
+@@ -146,6 +141,11 @@ typedef bool _Bool;
+ #define  IPV6HDRLEN 40
+ #endif // HAVE_AF_PACKET
+ 
++#if ((HAVE_TUNTAP_TAP) || (HAVE_TUNTAP_TUN))
++#include <linux/if_tun.h>
++#include <sys/ioctl.h>
++#endif
++
+ #ifdef WIN32
+ 
+ /* Windows config file */
+-- 
+2.33.0
+

--===============5402047290387276958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5402047290387276958==--
