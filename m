From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Oct 2011 14:05:49 +0200
Subject: [Buildroot] [git commit] oprofile: allow builds with external
	toolchains
Message-ID: <20111027132529.2A3458F290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f9c4c0aa5dcd2329fc5eb17959f634fd9c9a822
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Benoit Mauduit. Now that we can build binutils for
the target with external toolchains, oprofile is also available.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/oprofile/Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 0e3652d..562c910 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
-	# The dependency on binutils_target does not work with
-	# external toolchains since the binutils version was not
-	# choosen in the config. This will have to be fixed later.
-	depends on !BR2_TOOLCHAIN_EXTERNAL
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
 	depends on BR2_INSTALL_LIBSTDCPP
