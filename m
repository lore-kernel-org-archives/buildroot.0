From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Apr 2018 19:39:41 +0200
Subject: [Buildroot] [git commit] package/snort: select libdnet package
Message-ID: <20180401173953.B7DBC83480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2c5d59e65e84497a7c048e023433fec8d3b595f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"libdnet is in the dependency chain of snort that has added it to its
_DEPENDENCIES variable without selecting it or depending on it from
Config.in"

Fixes:
http://autobuild.buildroot.net/results/9cf/9cf5883d1ed95d3d76d529a9a25f0e600adf25cd

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snort/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/snort/Config.in b/package/snort/Config.in
index d1a59d5050..7d2c52c3f3 100644
--- a/package/snort/Config.in
+++ b/package/snort/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SNORT
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # daq
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	select BR2_PACKAGE_LIBDNET
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_DAQ
 	select BR2_PACKAGE_PCRE
