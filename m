From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 09:37:22 +0200
Subject: [Buildroot] [git commit] package/python-fire: bump to version 0.2.0
Message-ID: <20190728074027.6973D83D20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=850d293884de5e6294d2476f8e670b577da7f9cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fire/Config.in        | 2 ++
 package/python-fire/python-fire.hash | 4 ++--
 package/python-fire/python-fire.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-fire/Config.in b/package/python-fire/Config.in
index 2c6e55ab6b..b718ddac5e 100644
--- a/package/python-fire/Config.in
+++ b/package/python-fire/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_FIRE
 	bool "python-fire"
 	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_TERMCOLOR # runtime
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
 	help
 	  A library for automatically generating command line
 	  interfaces.
diff --git a/package/python-fire/python-fire.hash b/package/python-fire/python-fire.hash
index d6304369d5..6c48950b7a 100644
--- a/package/python-fire/python-fire.hash
+++ b/package/python-fire/python-fire.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fire/json
-md5	44c51c634b61acc7ed42a413a64de38a  fire-0.1.3.tar.gz
-sha256	c299d16064ff81cbb649b65988300d4a28b71ecfb789d1fb74d99ea98ae4d2eb  fire-0.1.3.tar.gz
+md5	dccf1cbd740146d52d9896e4a5ba673e  fire-0.2.0.tar.gz
+sha256	cdae28ea728d6cad487c900d534426d2cd09ddd2993287a885ff7c8accb097c8  fire-0.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256	a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
index bdb5ee191c..2573a577db 100644
--- a/package/python-fire/python-fire.mk
+++ b/package/python-fire/python-fire.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FIRE_VERSION = 0.1.3
+PYTHON_FIRE_VERSION = 0.2.0
 PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
-PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/5a/b7/205702f348aab198baecd1d8344a90748cb68f53bdcd1cc30cbc08e47d3e
+PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/40/6e/48cf0cffb7bf0bb58746bff99ed2d1a2769a32c4d74c06f988eb3e554f86
 PYTHON_FIRE_SETUP_TYPE = setuptools
 PYTHON_FIRE_LICENSE = Apache-2.0
 PYTHON_FIRE_LICENSE_FILES = LICENSE
