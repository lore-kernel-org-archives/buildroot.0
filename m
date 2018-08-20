From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 22:26:27 +0200
Subject: [Buildroot] [git commit branch/next] python-setuptools: bump to
 40.0.0
Message-ID: <20180820202247.38FAF8DFE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb9d0e38101d3f62096550e0a39dbd18932ccc87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With the introduction of Python 3.7.0, setuptools also needs to be updated.
Without the update, several packages will fail to build or install with a
ValueError: bad marshal data (unknown type code).

Updating setuptools to 40.0.0 version fixes this issue.

Even though 40.1.0 is out, updating to 40.0.0 is recommended as it seems like
40.1.0 breaks version detection on some python packages such as
python-cryptography which will error out with a complaint that setuptools is too
old, even though it's at 40.1.0. Using 40.0.0 fixes the issue.

Fixes:
http://autobuild.buildroot.net/results/636/636da0febe02f991095965d52cc4a8b2da644777/
http://autobuild.buildroot.net/results/5f6/5f659130a6a32a4c43d6ed2c3b559df77ae18249/
Signed-off-by: Adam Duskett <aduskett@greenlots.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools/python-setuptools.hash | 2 +-
 package/python-setuptools/python-setuptools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index f116a69f74..c905d8254a 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2599b4c452e77824bbd6da28d16b1fe8159c7a4c203d8d419d8b348fde7b9549  python-setuptools-v38.4.0.tar.gz
+sha256  327e232b1809c9481256408fe9233bcf6a27f9f63ddbbadc526f451e5027aad5  python-setuptools-v40.0.0.tar.gz
 sha256  c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 004fc0db2a..8db8511286 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = v38.4.0
+PYTHON_SETUPTOOLS_VERSION = v40.0.0
 PYTHON_SETUPTOOLS_SITE = $(call github,pypa,setuptools,$(PYTHON_SETUPTOOLS_VERSION))
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
