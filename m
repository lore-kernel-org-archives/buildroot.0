From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 22:32:10 +0100
Subject: [Buildroot] [git commit] package/gtkmm3: disable for NiosII
Message-ID: <20151228213231.CD0F68179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0c0ed2cf9761f7f14f50746520f621331863057
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like for Qt GUI module, disable for niosII to avoid a toolchain issue
[1][2].

[1] http://lists.busybox.net/pipermail/buildroot/2015-December/148428.html
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=19405

Avoid:
http://autobuild.buildroot.net/results/3e2/3e2ad2de03b5e9f181332d06dcf860e51fcd47f8/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtkmm3/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index f617d83..80dbbde 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_GTKMM3
 	bool "gtkmm3"
+	# Broken on existing external/internal nios2 toolchains,
+	# revisit when they are upgraded with at least Binutils >= 2.26
+	# and GCC >= 5.3.
+	# https://sourceware.org/bugzilla/show_bug.cgi?id=19405
+	depends on !BR2_nios2
 	depends on BR2_ARCH_HAS_ATOMICS # libcairomm/libgtk3/libpangomm -> cairo
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
