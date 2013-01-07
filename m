From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:59:56 +0100
Subject: [Buildroot] [git commit] elfutils: needs wchar
Message-ID: <20130107212533.D61C49A27C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b595d512f52dccfa03105d83cd2a8656804cc8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elfutils contains a call to wmempcpy, which is only available when the
toolchain has wchar support, so add the dependency.

Also display a comment if the toolchain dependencies are not met.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/elfutils/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index b107a97..914eec6 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,3 +1,6 @@
+comment "elfutils requires a toolchain with LARGEFILE and WCHAR support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
 	select BR2_PACKAGE_ARGP_STANDALONE if \
@@ -6,6 +9,7 @@ config BR2_PACKAGE_ELFUTILS
 	       BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
 	help
 	  Libraries/utilities to handle ELF objects (drop in
 	  replacement for libelf).
