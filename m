From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 May 2014 23:19:35 +0200
Subject: [Buildroot] [git commit] qt5base: stop qt stripping installed
	libraries
Message-ID: <20140529212159.548199BB4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05fb9bd16569bcc07dfc646afe782f4ebf4dd3f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default the 'make install' step for qt5base will strip all the binaries
and libraries when they are installed to staging. This hinders debugging
as the libraries in staging dir have been stripped and is unnecessary
as buildroot will strip all files on the target

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../qt5/qt5base/qt5base-0002-mkspecs-files.patch   |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
index 06436b4..6283bbe 100644
--- a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
+++ b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
@@ -14,13 +14,14 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
 ===================================================================
 --- /dev/null
 +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
-@@ -0,0 +1,11 @@
+@@ -0,0 +1,12 @@
 +include(../common/linux_device_pre.conf)
 +
 +#modifications to gcc-base.conf
 +QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
 +QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
 +QMAKE_CXXFLAGS_RELEASE += -O3
++CONFIG                 += nostrip
 +
 +QMAKE_LIBS             += -lrt -lpthread -ldl
 +
