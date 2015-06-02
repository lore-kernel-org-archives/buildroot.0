From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 22:59:54 +0200
Subject: [Buildroot] [git commit] libpcap: fix noMMU build
Message-ID: <20150602210249.B99E4819D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=715f7b98c862e3ae1652effb90586a61ac4f8b6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a "uClinux is also Linux" patch to fix build for Blackfin.

Fixes:
http://autobuild.buildroot.net/results/e19/e19e8ebb46560050029576baa040f2c6928e6424/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ....in-fix-detect-of-if_bonding.h-on-uclinux.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch b/package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch
new file mode 100644
index 0000000..7838c6f
--- /dev/null
+++ b/package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch
@@ -0,0 +1,30 @@
+From 5b8dc4eaeab60d5effc33055e5bce9ac0d98d339 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 2 Jun 2015 21:39:15 +0300
+Subject: [PATCH] configure.in: fix detect of if_bonding.h on uclinux
+
+noMMU Linux (uClinux) is also Linux
+
+Upstream status: https://github.com/the-tcpdump-group/libpcap/pull/440
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index be4b29e2f8ba..31287d0dbe61 100644
+--- a/configure.in
++++ b/configure.in
+@@ -149,7 +149,7 @@ struct rtentry;
+ fi
+ 
+ case "$host_os" in
+-linux*)
++linux*|uclinux*)
+ 	AC_CHECK_HEADERS(linux/sockios.h linux/if_bonding.h,,,
+ 	[
+ #include <sys/socket.h>
+-- 
+2.1.4
+
