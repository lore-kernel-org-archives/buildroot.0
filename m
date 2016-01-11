From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2016 17:29:45 +0100
Subject: [Buildroot] [git commit] cdrkit: add zlib select
Message-ID: <20160111163526.5AACE826C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa67fbbb3f3c880721f0cea8a07baf2e28d67f41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's inconsistent with it's DEPENDENCIES otherwise, fixes:
http://autobuild.buildroot.net/results/ac1/ac1e671dcd66c3823cf2e289604ed56f14f7161e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cdrkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index 3b0b7f1..46c0ba9 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CDRKIT
 	# Needed for libbz
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	bool "cdrkit"
