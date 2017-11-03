From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 22:01:18 +0100
Subject: [Buildroot] [git commit] package/python-toml: bump to version 0.9.3
Message-ID: <20171103205425.A10DD80F86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebaf9f7ffd2504e48d32e16b327aae1162eba8f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump package to version 0.9.3 and change _SETUP_TYPE to
'setuptools', since its setup.py now uses 'setuptools' by default and
switches to 'distutils' only as a fallback[1]

[1] https://github.com/uiri/toml/blob/0.9.3/setup.py#L2

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-toml/python-toml.hash | 2 +-
 package/python-toml/python-toml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-toml/python-toml.hash b/package/python-toml/python-toml.hash
index cbc71a9..20737c3 100644
--- a/package/python-toml/python-toml.hash
+++ b/package/python-toml/python-toml.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	aee9679726f42fb09f48b9701a321571e0b6a51305c3e0f3913b3057d8bf7083  python-toml-0.9.2.tar.gz
+sha256	633a90ecb1f5665b58f0c94153fcf519313ef53e1de0eac90929cd6b6a014235  python-toml-0.9.3.tar.gz
diff --git a/package/python-toml/python-toml.mk b/package/python-toml/python-toml.mk
index fec113e..fae15f9 100644
--- a/package/python-toml/python-toml.mk
+++ b/package/python-toml/python-toml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOML_VERSION = 0.9.2
+PYTHON_TOML_VERSION = 0.9.3
 PYTHON_TOML_SITE = $(call github,uiri,toml,$(PYTHON_TOML_VERSION))
-PYTHON_TOML_SETUP_TYPE = distutils
+PYTHON_TOML_SETUP_TYPE = setuptools
 PYTHON_TOML_LICENSE = MIT
 PYTHON_TOML_LICENSE_FILES = LICENSE
 
