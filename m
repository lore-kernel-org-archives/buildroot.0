From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  4 Apr 2018 17:51:32 +0200
Subject: [Buildroot] [PATCH 2/2] python-webpy: security bump to version 0.39
In-Reply-To: <20180404155132.17500-1-peter@korsgaard.com>
References: <20180404155132.17500-1-peter@korsgaard.com>
Message-ID: <20180404155132.17500-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the changelog:

2018-02-28 0.39
* Fixed a security issue with the form module (tx Orange Tsai)
* Fixed a security issue with the db module (tx Adri?n Brav and Orange Tsai)

2016-07-08 0.38
..
* Fixed a potential remote exeution risk in `reparam` (tx Adri?n Brav)

License files are still not included on pypi, so continue to use the git
repo. Upstream has unfortunately not tagged 0.39, so use the latest commit
on the 0.39 branch.  A request to fix this has been submitted:

https://github.com/webpy/webpy/issues/449

0.39 now uses setuptools, so change the _SETUP_TYPE.

Add hashes for the license files.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-webpy/python-webpy.hash | 4 +++-
 package/python-webpy/python-webpy.mk   | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
index 0e0a8d0fb8..30a14f4705 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,2 +1,4 @@
 # Locally computed
-sha256  c3cb8930739294103b1ad109e5fd1d0efae67c06d5b6d59fce5b5a2ee6b21624  python-webpy-webpy-0.37.tar.gz
+sha256  e17ac483846fb15629c76c43cf64c0b65eac3c870dca2251801b459b1e4e12b8  python-webpy-6df75fe581e0e838d28334d5c53f52421560d38b.tar.gz
+sha256  3826fd531a9b904841f5e3560fcda7e93f2ab8d11ef124ec65e10625efa26c34  LICENSE.txt
+sha256  7347fd17bfd33c4093c31dc77076733e1e0150ce8c13296c56dc042bbecede84  web/wsgiserver/LICENSE.txt
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index 8bcc8ec37f..1e67cd6fd8 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WEBPY_VERSION = webpy-0.37
+# corresponds to 0.39
+PYTHON_WEBPY_VERSION = 6df75fe581e0e838d28334d5c53f52421560d38b
 PYTHON_WEBPY_SITE = $(call github,webpy,webpy,$(PYTHON_WEBPY_VERSION))
-PYTHON_WEBPY_SETUP_TYPE = distutils
+PYTHON_WEBPY_SETUP_TYPE = setuptools
 PYTHON_WEBPY_LICENSE = Public Domain, CherryPy License
 PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt web/wsgiserver/LICENSE.txt
 
-- 
2.11.0
