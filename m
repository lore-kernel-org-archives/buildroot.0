From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Nov 2014 10:04:03 +0100
Subject: [Buildroot] [git commit] schifra: mark as broken
Message-ID: <20141113090639.9465DAD256@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54f3f58b2b86f024678ab983f671f93d00ea8ec3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are many build failures caused by schifra, due to upstream
changing the tarball without doing new releases. Since has been an
on-going problem for some time, and is now the #1 issue in the
autobuilders. So let's mark this package broken, until someone cares
enough to fix it, or until we remove it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/schifra/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/schifra/Config.in b/package/schifra/Config.in
index 486f92d..a3f699a 100644
--- a/package/schifra/Config.in
+++ b/package/schifra/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_SCHIFRA
 	bool "schifra"
 	depends on BR2_INSTALL_LIBSTDCPP
+	# Upstream keep changing the tarball without doing new
+	# releases. This is not acceptable for Buildroot, as
+	# reproducible builds are very important.
+	depends on BR2_BROKEN
 	help
 	  Schifra is a very robust, highly optimized and extremely configurable
 	  Reed-Solomon error correcting code library for both software and IP
@@ -18,4 +22,5 @@ config BR2_PACKAGE_SCHIFRA_EXAMPLES
 endif
 
 comment "schifra needs a toolchain w/ C++"
+	depends on BR2_BROKEN
 	depends on !BR2_INSTALL_LIBSTDCPP
