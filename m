From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Apr 2013 23:00:44 +0200
Subject: [Buildroot] [git commit] swig: new package
Message-ID: <20130421211400.BF4EB9B783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65dc5b7ad2fb690774fa30af0a39048dc9cab1f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the swig package, host-variant only since toolchain on the target is
deprecated and this package wouldn't serve any purpose.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/swig/swig.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
new file mode 100644
index 0000000..6aaf969
--- /dev/null
+++ b/package/swig/swig.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# swig
+#
+#############################################################
+
+SWIG_VERSION = 2.0.9
+SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
+SWIG_DEPENDENCIES = host-bison
+HOST_SWIG_CONF_OPT = --without-pcre --disable-ccache
+SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
+SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
+
+$(eval $(host-autotools-package))
