From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 21:46:01 +0100
Subject: [Buildroot] [git commit] powerpc-utils: needs dynamic toolchain
Message-ID: <20160229204612.3AE8C817D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d42c7142250881569652de824d41a42d665fd1d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a12/a1240ed6facb99518d71153c099dbd7d3d847af6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powerpc-utils/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index 8e02e76..e18254c 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -1,5 +1,10 @@
+comment "powerpc-utils tools needs a toolchain w/ dynamic library"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_POWERPC_UTILS
 	bool "powerpc-utils"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	select BR2_PACKAGE_ZLIB
 	help
