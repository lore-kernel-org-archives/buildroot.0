Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD6CD10BEC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 08:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 042EB60BEF;
	Sat, 26 Oct 2024 08:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KARH04x2nuB4; Sat, 26 Oct 2024 08:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B919F60AFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B919F60AFA;
	Sat, 26 Oct 2024 08:47:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 353525C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 153E4403A1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skw5loJKjLbS for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 08:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B751F403B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B751F403B0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2D1683683; Sat, 26 Oct 2024 08:47:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 10:46:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57d94b293b0b0826a17784d326c46f0bdc02f685
X-Git-Newrev: 0748d96940db9904f9f6eeac96649df2a1c15091
X-Patchwork-Hint: ignore
Message-Id: <20241026084708.A2D1683683@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: bump to version 6.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0748d96940db9904f9f6eeac96649df2a1c15091
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The building test using musl as the C library for the cross-compilation
toolchain raised errors that required the application of two additional
patches.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0004-bridge-mst-fix-a-musl-build-issue.patch   | 73 ++++++++++++++++++++++
 ...bridge-mst-fix-a-further-musl-build-issue.patch | 56 +++++++++++++++++
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 4 files changed, 131 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch b/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
new file mode 100644
index 0000000000..3deb42ae95
--- /dev/null
+++ b/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
@@ -0,0 +1,73 @@
+From 0359ee6dc57ee8aa21a3f0f7404422c0f9372d3a Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sun, 22 Sep 2024 14:00:42 +0200
+Subject: [PATCH] bridge: mst: fix a musl build issue
+
+This patch fixes a compilation error raised by the bump to version 6.11.0
+in Buildroot using musl as the C library for the cross-compilation
+toolchain.
+
+After setting the CFLGAS
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+IPROUTE2_CFLAGS += -D__UAPI_DEF_IN6_ADDR=0 -D__UAPI_DEF_SOCKADDR_IN6=0 \
+			-D__UAPI_DEF_IPV6_MREQ=0
+endif
+
+to fix the following errors:
+
+In file included from ../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/arpa/inet.h:9,
+                 from ../include/libnetlink.h:14,
+                 from mst.c:10:
+../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
+   23 | struct in6_addr {
+      |        ^~~~~~~~
+In file included from ../include/uapi/linux/if_bridge.h:19,
+                 from mst.c:7:
+../include/uapi/linux/in6.h:33:8: note: originally defined here
+   33 | struct in6_addr {
+      |        ^~~~~~~~
+../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:34:8: error: redefinition of 'struct sockaddr_in6'
+   34 | struct sockaddr_in6 {
+      |        ^~~~~~~~~~~~
+../include/uapi/linux/in6.h:50:8: note: originally defined here
+   50 | struct sockaddr_in6 {
+      |        ^~~~~~~~~~~~
+../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:42:8: error: redefinition of 'struct ipv6_mreq'
+   42 | struct ipv6_mreq {
+      |        ^~~~~~~~~
+../include/uapi/linux/in6.h:60:8: note: originally defined here
+   60 | struct ipv6_mreq {
+
+I got this further errors
+
+../include/uapi/linux/in6.h:72:25: error: field 'flr_dst' has incomplete type
+   72 |         struct in6_addr flr_dst;
+      |                         ^~~~~~~
+../include/uapi/linux/if_bridge.h:711:41: error: field 'ip6' has incomplete type
+  711 |                         struct in6_addr ip6;
+      |                                         ^~~
+
+fixed by including the netinet/in.h header.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=6a77abab92516e65f07f8657fc4e384c4541ce0e
+---
+ bridge/mst.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bridge/mst.c b/bridge/mst.c
+index 873ca5369fd6..c8f7e6606c3c 100644
+--- a/bridge/mst.c
++++ b/bridge/mst.c
+@@ -4,6 +4,7 @@
+  */
+ 
+ #include <stdio.h>
++#include <netinet/in.h>
+ #include <linux/if_bridge.h>
+ #include <net/if.h>
+ 
+-- 
+2.43.0
+
diff --git a/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch b/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
new file mode 100644
index 0000000000..d1981f74e2
--- /dev/null
+++ b/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
@@ -0,0 +1,56 @@
+From 62c4dfff5ff596984ece7960fba49b05d69f37a7 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sun, 22 Sep 2024 14:11:18 +0200
+Subject: [PATCH] bridge: mst: fix a further musl build issue
+
+This patch fixes the following build errors:
+
+In file included from mst.c:11:
+../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+      |                              ^~~~~~~
+../include/json_print.h:50:37: note: in definition of macro '_PRINT_FUNC'
+   50 |                                     type value);                        \
+      |                                     ^~~~
+../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+      |                              ^~~~~~~
+../include/json_print.h:55:45: note: in definition of macro '_PRINT_FUNC'
+   55 |                                             type value)                 \
+      |                                             ^~~~
+../include/json_print.h: In function 'print_tv':
+../include/json_print.h:58:48: error: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
+   58 |                                                value);                  \
+      |                                                ^~~~~
+      |                                                |
+      |                                                const struct timeval *
+../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+      | ^~~~~~~~~~~
+../include/json_print.h:50:42: note: expected 'const struct timeval *' but argument is of type 'const struct timeval *'
+   50 |                                     type value);                        \
+      |                                          ^
+../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=043ef90e2fa94397eb5c85330889ca4146a6d58a
+---
+ bridge/mst.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bridge/mst.c b/bridge/mst.c
+index c8f7e6606c3c..fccb7fd68140 100644
+--- a/bridge/mst.c
++++ b/bridge/mst.c
+@@ -4,6 +4,7 @@
+  */
+ 
+ #include <stdio.h>
++#include <sys/time.h>
+ #include <netinet/in.h>
+ #include <linux/if_bridge.h>
+ #include <net/if.h>
+-- 
+2.43.0
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 0760183b9e..028a324396 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  91a62f82737b44905a00fa803369c447d549e914e9a2a4018fdd75b1d54e8dce  iproute2-6.10.0.tar.xz
+sha256  1f795398a04aeaacd06a8f6ace2cfd913c33fa5953ca99daae83bb5c534611c3  iproute2-6.11.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 08b890b331..c452b64cde 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.10.0
+IPROUTE2_VERSION = 6.11.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
