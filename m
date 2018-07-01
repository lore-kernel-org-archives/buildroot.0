From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 15:48:11 +0200
Subject: [Buildroot] [git commit] python-libconfig: fix build with python2
Message-ID: <20180701134604.102C88025D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c59813b52f480268af6229738e2b65f944e26d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since boost 1.67, libboost_python is now named libboost_python27 when
python2 is enabled

Fixes:
 - http://autobuild.buildroot.net/results/a1feb4c4b70b3c939ae1127417130ea33a91159b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Determine-boost_python-name-depending-on-current-Pyt.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch b/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch
index 53000cd678..478bac76f6 100644
--- a/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch
+++ b/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch
@@ -4,8 +4,8 @@ Date: Thu, 27 Jul 2017 09:46:07 +0200
 Subject: [PATCH] Determine boost_python name depending on current Python
  version
 
-Python2 requires boost_python and Python3 requires boost_python36 (since
-boost 1.67).
+Python2 requires boost_python27 and Python3 requires boost_python36
+(since boost 1.67).
 
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
@@ -23,7 +23,7 @@ index fdf5c27..4b38569 100644
  
 +boostlib = "boost_python36"
 +if sys.version_info < (3, 0):
-+    boostlib = "boost_python"
++    boostlib = "boost_python27"
 +
  setup(
      name				= 'pylibconfig',
