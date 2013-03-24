From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 23:31:44 +0100
Subject: [Buildroot] [git commit] texinfo: new host package
Message-ID: <20130324223349.917749B2AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69aeb066a68108e0f78af34d5baf770c490954d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The makeinfo program from texinfo is needed to get Crosstool-NG to
build properly a toolchain. Long term, it would be great if
Crosstool-NG supported building without texinfo, simply by disabling
the build of documentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/texinfo/texinfo.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/texinfo/texinfo.mk b/package/texinfo/texinfo.mk
new file mode 100644
index 0000000..54d18b6
--- /dev/null
+++ b/package/texinfo/texinfo.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# texinfo
+#
+#############################################################
+
+# We are intentionally not using the latest version 5.x, because it
+# causes issues with the documentation building process when creating
+# a toolchain with the Crosstool-NG backend.
+
+TEXINFO_VERSION = 4.13a
+TEXINFO_SITE = $(BR2_GNU_MIRROR)/texinfo
+
+$(eval $(host-autotools-package))
