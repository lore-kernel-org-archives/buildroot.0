From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 10:32:09 +0100
Subject: [Buildroot] [git commit] New package: libical
Message-ID: <20120131093437.33DDA9095A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cae6aa9a41d1a3ffe3fa437b05c3000624a4ef65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: small Config.in tweaks]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libical/Config.in  |   11 +++++++++++
 package/libical/libical.mk |   12 ++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eb3abe8..f5c7601 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -373,6 +373,7 @@ source "package/libevent/Config.in"
 source "package/libev/Config.in"
 source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
+source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
 source "package/orc/Config.in"
diff --git a/package/libical/Config.in b/package/libical/Config.in
new file mode 100644
index 0000000..5907548
--- /dev/null
+++ b/package/libical/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBICAL
+	bool "libical"
+	depends on BR2_USE_WCHAR
+	help
+	  libical is an Open Source (MPL/LGPL) implementation of the IETF's
+	  iCalendar Calendaring and Scheduling protocols.
+
+	  http://www.citadel.org/doku.php/documentation:featured_projects:libical
+
+comment "libical requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
new file mode 100644
index 0000000..ee251eb
--- /dev/null
+++ b/package/libical/libical.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libical
+#
+#############################################################
+
+LIBICAL_VERSION = 0.48
+LIBICAL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
+LIBICAL_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
+
