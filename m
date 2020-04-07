From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 20:17:57 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-pyyaml:
 security bump to version 5.3.1
Message-ID: <20200407180804.F40A88D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae0bca61ecbc2a791689e82454ffad39b352ac26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

 386: Prevents arbitrary code execution during python/object/new
 constructor

https://github.com/yaml/pyyaml/pull/386

The hash of the license file changed due to the following diff:

-Copyright (c) 2017-2019 Ingy d??t Net
+Copyright (c) 2017-2020 Ingy d??t Net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9063df44da2c19ec23b228ab8e7d29ebb2a3eb4f)
[Peter: mention security impact]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyyaml/python-pyyaml.hash | 6 +++---
 package/python-pyyaml/python-pyyaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
index e0d182bcbb..90e1f2199e 100644
--- a/package/python-pyyaml/python-pyyaml.hash
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyYAML/json
-md5	adbb0d336b509d6472d3b095a0f1cf30  PyYAML-5.3.tar.gz
-sha256	e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615  PyYAML-5.3.tar.gz
+md5  d3590b85917362e837298e733321962b  PyYAML-5.3.1.tar.gz
+sha256  b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d  PyYAML-5.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256	a2adb9c959b797494a0ef80bdf60e22db2749ee3e0c0908556e3eb548f967c56  LICENSE
+sha256  c40112449f254b9753045925248313e9270efa36d226b22d82d4cc6c43c57f29  LICENSE
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 5d9246d37c..78506390a4 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYYAML_VERSION = 5.3
+PYTHON_PYYAML_VERSION = 5.3.1
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/3d/d9/ea9816aea31beeadccd03f1f8b625ecf8f645bd66744484d162d84803ce5
+PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c
 PYTHON_PYYAML_SETUP_TYPE = distutils
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
