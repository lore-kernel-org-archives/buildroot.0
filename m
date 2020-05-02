From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 18:45:51 +0200
Subject: [Buildroot] [git commit] package/python-msgfy: bump to version 0.1.0
Message-ID: <20200502163126.3CC4190D15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=205557a2879cfedf1b499dc834c902e1db52a7a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- python 2 support has been dropped since version 0.1.0 and
  https://github.com/thombashi/msgfy/commit/8ddfd20132b8d4825214252189a65570b562619f
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-msgfy/Config.in         | 1 +
 package/python-msgfy/python-msgfy.hash | 6 +++---
 package/python-msgfy/python-msgfy.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-msgfy/Config.in b/package/python-msgfy/Config.in
index 7875379e9e..f5a471633a 100644
--- a/package/python-msgfy/Config.in
+++ b/package/python-msgfy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MSGFY
 	bool "python-msgfy"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  msgfy is a Python library for convert Exception instance to
 	  a human-readable error message.
diff --git a/package/python-msgfy/python-msgfy.hash b/package/python-msgfy/python-msgfy.hash
index 8f664ec2e5..c795f7fa5e 100644
--- a/package/python-msgfy/python-msgfy.hash
+++ b/package/python-msgfy/python-msgfy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgfy/json
-md5	3a94f49d7b31cc7bca21e0a9bfadf767  msgfy-0.0.7.tar.gz
-sha256	370c54bb036d3728af8004e750b7cd7bc5a4ac25f9cdb8be13b7865cae3c73ee  msgfy-0.0.7.tar.gz
+md5  4a3d8ac9908acd5f661a58b12f9e0d17  msgfy-0.1.0.tar.gz
+sha256  474c08302cd56ccee1300ac7976a01ebd1e42716fc9bcd947d39a311a15b7012  msgfy-0.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	fcfe96f8fb1bf3478a51c828e7f7afee01500ce1c2d4345d052edb858be05227  LICENSE
+sha256  fcfe96f8fb1bf3478a51c828e7f7afee01500ce1c2d4345d052edb858be05227  LICENSE
diff --git a/package/python-msgfy/python-msgfy.mk b/package/python-msgfy/python-msgfy.mk
index 0a642b4344..c187061d41 100644
--- a/package/python-msgfy/python-msgfy.mk
+++ b/package/python-msgfy/python-msgfy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGFY_VERSION = 0.0.7
+PYTHON_MSGFY_VERSION = 0.1.0
 PYTHON_MSGFY_SOURCE = msgfy-$(PYTHON_MSGFY_VERSION).tar.gz
-PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/23/82/b61a8353c36e60c2c8291c56ad7d00aa37918ef56811727510acada09f7f
+PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/24/b5/7cc6ba75b6489245f9b75f11a85202b934fa92f6c99a4fa1c639f08d68e8
 PYTHON_MSGFY_SETUP_TYPE = setuptools
 PYTHON_MSGFY_LICENSE = MIT
 PYTHON_MSGFY_LICENSE_FILES = LICENSE
