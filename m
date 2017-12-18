From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 09:52:41 +0100
Subject: [Buildroot] [git commit] shapelib: fix legal information
Message-ID: <20171218085343.BD314834D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85d6721e56971002aafbff2083537e24629eccf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the bump of shapelib in commit
333f5605958283c58f21a990bb5e36067489b72b, the licensing information
got broken, as the LICENSE.LGPL file is now named COPYING.

While at it, let's add the hashes for the license files.

Fixes:

  http://autobuild.buildroot.net/results/978db9ea9f04ad465252316e2f31085516a123bb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shapelib/shapelib.hash | 2 ++
 package/shapelib/shapelib.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
index 4f51392..6abddb2 100644
--- a/package/shapelib/shapelib.hash
+++ b/package/shapelib/shapelib.hash
@@ -1,2 +1,4 @@
 # Locally computed
 sha256 a4c94817365761a3a4c21bb3ca1c680a6bdfd3edd61df9fdd291d3e7645923b3  shapelib-1.4.1.tar.gz
+sha256 7eb803a70990017a1c4e38a8342d7413c5dfeec3ed1ac407e15ae2c274e560ff  COPYING
+sha256 a638278f7f1cb7d0cdc73b47a6c87261b882e356a8e79922e90d44d7ef1dd2c7  web/license.html
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index d6217ff..b76c3bb 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -7,7 +7,7 @@
 SHAPELIB_VERSION = 1.4.1
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
-SHAPELIB_LICENSE_FILES = web/license.html LICENSE.LGPL
+SHAPELIB_LICENSE_FILES = web/license.html COPYING
 SHAPELIB_INSTALL_STAGING = YES
 SHAPELIB_DEPENDENCIES = proj
 
