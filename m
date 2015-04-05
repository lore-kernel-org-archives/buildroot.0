From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 17:35:31 +0200
Subject: [Buildroot] [git commit] wvstreams: disable with the ARC external
	toolchain
Message-ID: <20150405153542.210827FFE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b8e4a7f4a1d7460485374ff6efda0bcb2ec5aa7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This toolchain lacks program_invocation_* in the uClibc configuration.

Fixes:

  http://autobuild.buildroot.org/results/653/6531009b2eae64b4e79f66a625cf2a3f9ffc2ac6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wvdial/Config.in    |    2 ++
 package/wvstreams/Config.in |    3 +++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
index e57f975..14befcf 100644
--- a/package/wvdial/Config.in
+++ b/package/wvdial/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_WVDIAL
 	bool "wvdial"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # wvstreams
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 # wvstreams
 	select BR2_PACKAGE_WVSTREAMS
 	help
 	  wvdial is an intelligent Point-to-Point Protocol dialer
@@ -11,3 +12,4 @@ config BR2_PACKAGE_WVDIAL
 comment "wvdial needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
index 3080dc7..0580516 100644
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_WVSTREAMS
 	bool "wvstreams"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
+	# toolchain lacks program_invocation_*
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -12,3 +14,4 @@ config BR2_PACKAGE_WVSTREAMS
 comment "wvstreams needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
