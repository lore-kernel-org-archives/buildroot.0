From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 10:54:03 +0200
Subject: [Buildroot] [PATCH] elfutils: disable on Blackfin,
	problem of assembly symbol prefix
Message-ID: <1400316843-25304-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/922/92291286e86f9ea943ae7aa58cbd884c8db0c5d2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 6025a74..20a1aaa 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,5 +1,6 @@
 comment "elfutils needs a toolchain w/ largefile, wchar"
 	depends on !BR2_avr32
+	depends on !BR2_bfin
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_ELFUTILS
@@ -11,6 +12,9 @@ config BR2_PACKAGE_ELFUTILS
 	# canonicalize_file_name() not available on uClibc 0.9.31, used
 	# only for AVR32
 	depends on !BR2_avr32
+	# build issue caused by the _ prefix used on blackfin for
+	# assembly symbols
+	depends on !BR2_bfin
 	help
 	  Libraries/utilities to handle ELF objects (drop in
 	  replacement for libelf).
-- 
1.9.3
