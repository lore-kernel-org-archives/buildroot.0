From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 11:36:18 +0200
Subject: [Buildroot] [git commit] elfutils: disable on Blackfin,
	problem of assembly symbol prefix
Message-ID: <20140517093855.543649CC52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1cf2b21dd9e2283f9020e3a5ac9ac35f8855c1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/922/92291286e86f9ea943ae7aa58cbd884c8db0c5d2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elfutils/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
