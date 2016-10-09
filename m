From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:41:25 +0200
Subject: [Buildroot] [git commit] package/wvstreams: mark as deprecated
Message-ID: <20161009204131.7127E82132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=521cf82ad842e019c07e3a0d1c0c29c09ae00776
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by J??rg and I [1] [2], wvstreams is not maintained anymore. Last
activity was on Github was 2011, the current version 1.6.1 dates from 2009.

Also it doesn't build anymore with a recent compiler (gcc5 and gcc6).
Instead of stacking patches forever, mark this wvstreams and wvdial deprecated
before removing them completely.

Remove following failures from autobuilders.
http://autobuild.buildroot.net/results/f01/f0166f030875ecaf0d757790de6361339071831e
http://autobuild.buildroot.net/results/32b/32b4eba8c7cbe8a3b1cde2d67f1af3f913fcc292
http://autobuild.buildroot.net/results/38f/38fefa126596c6e267ffaf0f2dd9c5e3dcf09aff
http://autobuild.buildroot.net/results/ea2/ea223c8a4f817541f55aa36c47b159a316031bff

[1] http://patchwork.ozlabs.org/patch/674238/
[2] http://patchwork.ozlabs.org/patch/505304/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wvdial/Config.in    | 2 ++
 package/wvstreams/Config.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
index 03730f3..0c13202 100644
--- a/package/wvdial/Config.in
+++ b/package/wvdial/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WVDIAL
 	bool "wvdial"
+	depends on BR2_DEPRECATED_SINCE_2016_08
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # wvstreams
 	depends on !BR2_STATIC_LIBS # wvstreams
@@ -11,5 +12,6 @@ config BR2_PACKAGE_WVDIAL
 	  http://wvdial.googlecode.com/
 
 comment "wvdial needs a glibc or uClibc toolchain w/ C++, dynamic library"
+	depends on BR2_DEPRECATED_SINCE_2016_08
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
index 3d2d8f4..a550c57 100644
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WVSTREAMS
 	bool "wvstreams"
+	depends on BR2_DEPRECATED_SINCE_2016_08
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
@@ -13,5 +14,6 @@ config BR2_PACKAGE_WVSTREAMS
 	  http://wvstreams.googlecode.com/
 
 comment "wvstreams needs a glibc or uClibc toolchain w/ C++, dynamic library"
+	depends on BR2_DEPRECATED_SINCE_2016_08
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
