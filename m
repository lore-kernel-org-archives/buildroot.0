From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Jan 2015 23:14:34 +0100
Subject: [Buildroot] [git commit] python-coherence: new package
Message-ID: <20150131222039.BB48A8046F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54278f85f1b5631f7a90e0224abc419be8846c58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add missing select for zope-interface]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |    1 +
 package/python-coherence/Config.in             |   10 ++++++++++
 package/python-coherence/python-coherence.hash |    2 ++
 package/python-coherence/python-coherence.mk   |   14 ++++++++++++++
 4 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3117474..d140721 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -490,6 +490,7 @@ menu "external python modules"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-cheetah/Config.in"
+	source "package/python-coherence/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
diff --git a/package/python-coherence/Config.in b/package/python-coherence/Config.in
new file mode 100644
index 0000000..d4034e7
--- /dev/null
+++ b/package/python-coherence/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_COHERENCE
+	bool "python-coherence"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_TWISTED
+	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
+	select BR2_PACKAGE_PYTHON_PYASN
+	help
+	  A DLNA/UPnP Media Server and Framework for the Digital Living.
+
+	  http://coherence-project.org/
diff --git a/package/python-coherence/python-coherence.hash b/package/python-coherence/python-coherence.hash
new file mode 100644
index 0000000..f788ca3
--- /dev/null
+++ b/package/python-coherence/python-coherence.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  fd5a2db9661994a57232ace4a90d259b6554c43b8bf5bfbf8ec2518c03627922  python-coherence-0.6.6.2.tar.gz
diff --git a/package/python-coherence/python-coherence.mk b/package/python-coherence/python-coherence.mk
new file mode 100644
index 0000000..301885b
--- /dev/null
+++ b/package/python-coherence/python-coherence.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-coherence
+#
+################################################################################
+
+PYTHON_COHERENCE_VERSION = 0.6.6.2
+PYTHON_COHERENCE_SITE = $(call github,coherence-project,Coherence,Coherence-$(PYTHON_COHERENCE_VERSION))
+PYTHON_COHERENCE_SETUP_TYPE = setuptools
+PYTHON_COHERENCE_LICENSE = MIT
+PYTHON_COHERENCE_LICENSE_FILES = LICENSE
+PYTHON_COHERENCE_DEPENDENCIES = python-twisted python-zope-interface python-pyasn
+
+$(eval $(python-package))
