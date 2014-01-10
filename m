From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2014 22:58:55 +0100
Subject: [Buildroot] [git commit] dtc: broken for static builds
Message-ID: <20140110220357.E5A599C43E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db6a436ff787b9339969671c7186d62b4f1d6a4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dtc package has hardcoded shared lib link options in the Makefile, so it
will fail if you try to build it on a static lib environment.

[Peter: Move comment under _PROGRAMS suboption for proper indentation]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dtc/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/dtc/Config.in b/package/dtc/Config.in
index fac6ab2..194b012 100644
--- a/package/dtc/Config.in
+++ b/package/dtc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DTC
 	bool "dtc (libfdt)"
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  The Device Tree Compiler, dtc, takes as input a device-tree in
 	  a given format and outputs a device-tree in another format.
@@ -31,3 +32,6 @@ comment "dtdiff will not be installed: it requires bash"
 	depends on !BR2_PACKAGE_BASH
 
 endif
+
+comment "dtc needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
