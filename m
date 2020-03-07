From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:52:02 +0100
Subject: [Buildroot] [git commit] package/thrift: disable qt4
Message-ID: <20200307213938.846EF8FD43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f81865717f893c7fa5c2d4ac297ce42ec784297
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-thrift can fail if a broken Qt4 is found on host:

CMake Error in lib/cpp/CMakeLists.txt:
  Imported target "Qt4::QtCore" includes non-existent path

    "/nvmedata/autobuild/instance-4/output-1/host/usr/mkspecs/default"

  in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:

  * The path was deleted, renamed, or moved to another location.

  * An install or uninstall procedure did not complete successfully.

  * The installation package was faulty and references files it does not
  provide.

Fixes:
 - http://autobuild.buildroot.org/results/57cad5313896c868e99b0b9534678f1c83a386f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/thrift/thrift.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 6014bbfcdd..4260fe7e1c 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -19,6 +19,7 @@ THRIFT_COMMON_CONF_OPTS = -DBUILD_TUTORIALS=OFF \
 	-DBUILD_TESTING=OFF \
 	-DWITH_PYTHON=OFF \
 	-DWITH_JAVA=OFF \
+	-DWITH_QT4=OFF \
 	-DWITH_QT5=OFF
 
 THRIFT_CONF_OPTS = $(THRIFT_COMMON_CONF_OPTS) -DBUILD_COMPILER=OFF
