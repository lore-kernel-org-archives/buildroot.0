From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 15:35:42 +0200
Subject: [Buildroot] [git commit] python-pigpio: new package
Message-ID: <20181009133505.6B6E8814CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f99a1f95c9323b3216ed12d080e800476f3ff91a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pigpio is a Python module for the Raspberry Pi
which talks to the pigpio daemon to allow control
of the general purpose input outputs (GPIO).

http://abyz.co.uk/rpi/pigpio/python.html

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Thomas: use proper SPDX license tag]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-pigpio/Config.in          |  8 ++++++++
 package/python-pigpio/python-pigpio.hash |  3 +++
 package/python-pigpio/python-pigpio.mk   | 13 +++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 09d7138827..824f3a3c58 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -924,6 +924,7 @@ N:	Grzegorz Blach <grzegorz@blach.pl>
 F:	package/pigpio/
 F:	package/python-falcon/
 F:	package/python-mimeparse/
+F:	package/python-pigpio/
 
 N:	Guillaume Gardet <guillaume.gardet@oliseo.fr>
 F:	package/c-icap/
diff --git a/package/Config.in b/package/Config.in
index 09e281eb39..77e5f4cc39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -922,6 +922,7 @@ menu "External python modules"
 	source "package/python-pathvalidate/Config.in"
 	source "package/python-pexpect/Config.in"
 	source "package/python-pickleshare/Config.in"
+	source "package/python-pigpio/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-pip/Config.in"
 	source "package/python-portend/Config.in"
diff --git a/package/python-pigpio/Config.in b/package/python-pigpio/Config.in
new file mode 100644
index 0000000000..08c37cb9b2
--- /dev/null
+++ b/package/python-pigpio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PIGPIO
+	bool "python-pigpio"
+	help
+	  Pigpio is a Python module for the Raspberry Pi
+	  which talks to the pigpio daemon to allow control
+	  of the general purpose input outputs (GPIO).
+
+	  http://abyz.co.uk/rpi/pigpio/python.html
diff --git a/package/python-pigpio/python-pigpio.hash b/package/python-pigpio/python-pigpio.hash
new file mode 100644
index 0000000000..a0ef093ec5
--- /dev/null
+++ b/package/python-pigpio/python-pigpio.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/pigpio/json
+md5	32d7d5e2e042fb4f503b93858712e7ad  pigpio-1.40.post1.tar.gz
+sha256	38bdc1b4d58898e7b4a69de3b0d90e8e8ccd851ac7d03e30791769475ffd941f  pigpio-1.40.post1.tar.gz
diff --git a/package/python-pigpio/python-pigpio.mk b/package/python-pigpio/python-pigpio.mk
new file mode 100644
index 0000000000..7c4527ad94
--- /dev/null
+++ b/package/python-pigpio/python-pigpio.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pigpio
+#
+################################################################################
+
+PYTHON_PIGPIO_VERSION = 1.40.post1
+PYTHON_PIGPIO_SOURCE = pigpio-$(PYTHON_PIGPIO_VERSION).tar.gz
+PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/da/91/80c893c398bc6805592f44267bbf4bf88323de3db0f5e8f94b0fa8e28426
+PYTHON_PIGPIO_SETUP_TYPE = setuptools
+PYTHON_PIGPIO_LICENSE = Unlicense
+
+$(eval $(python-package))
