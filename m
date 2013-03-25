From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Mar 2013 00:27:57 +0100
Subject: [Buildroot] [PATCH 02/15] Added package enscript
In-Reply-To: <cover.1364253936.git.yann.morin.1998@free.fr>
References: <cover.1364253936.git.yann.morin.1998@free.fr>
Message-ID: <36d1f763f161ef74ae1e2a936d824658b2df6e10.1364253936.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Olivier Schonken <olivier.schonken@gmail.com>

GNU Enscript is a free replacement for Adobe's enscript program.
GNU Enscript converts ASCII files to PostScript, HTML, or RTF and
stores generated output to a file or sends it directly to the
printer. It includes features for `pretty-printing' (language-
sensitive code highlighting) in several programming languages.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
[yann.morin.1998 at free.fr: space-damage, unneeded variables, licensing terms]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in            |    1 +
 package/enscript/Config.in   |   11 +++++++++++
 package/enscript/enscript.mk |   19 +++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 package/enscript/Config.in
 create mode 100644 package/enscript/enscript.mk

diff --git a/package/Config.in b/package/Config.in
index be1aa99..82e6c5c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -290,6 +290,7 @@ endmenu
 
 menu "Interpreter languages and scripting"
 source "package/erlang/Config.in"
+source "package/enscript/Config.in"
 source "package/haserl/Config.in"
 source "package/jamvm/Config.in"
 source "package/lua/Config.in"
diff --git a/package/enscript/Config.in b/package/enscript/Config.in
new file mode 100644
index 0000000..f101397
--- /dev/null
+++ b/package/enscript/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ENSCRIPT
+	bool "enscript"
+	help
+	  GNU Enscript is a free replacement for Adobe's enscript program.
+
+	  GNU Enscript converts ASCII files to PostScript, HTML, or RTF and
+	  stores generated output to a file or sends it directly to the
+	  printer. It includes features for `pretty-printing' (language-
+	  sensitive code highlighting) in several programming languages.
+
+	   http://www.gnu.org/software/enscript
diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
new file mode 100644
index 0000000..93e4d6d
--- /dev/null
+++ b/package/enscript/enscript.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# enscript
+#
+#############################################################
+
+ENSCRIPT_VERSION = 1.6.6
+ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript/
+ENSCRIPT_LICENSE = GPLv3+
+ENSCRIPT_LICENSE_FILES = COPYING
+
+# Enable pthread threads if toolchain supports threads
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+	ENSCRIPT_CONF_OPT += --enable-threads=pth
+else
+	ENSCRIPT_CONF_OPT += --disable-threads
+endif
+
+$(eval $(autotools-package))
-- 
1.7.2.5
