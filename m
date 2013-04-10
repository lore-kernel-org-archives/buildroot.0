From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Apr 2013 17:29:25 -0300
Subject: [Buildroot] [PATCHv2 2/3] swig: new package
In-Reply-To: <1365625766-11256-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365625766-11256-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365625766-11256-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the swig package, host-variant only since toolchain on the target is
deprecated and this package wouldn't serve any purpose.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/swig/swig.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 package/swig/swig.mk

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
-- 
1.8.1.5
