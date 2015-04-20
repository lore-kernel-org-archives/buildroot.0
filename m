From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 22:35:58 +0200
Subject: [Buildroot] [git commit] boost: add option to disable container
	library
Message-ID: <20150420203827.43E8981D53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbbdde6e052b28b5c669ea29027c94d246861a28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in |    3 +++
 package/boost/boost.mk  |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 5444c42..add7069 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -55,6 +55,9 @@ config BR2_PACKAGE_BOOST_ATOMIC
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
 
+config BR2_PACKAGE_BOOST_CONTAINER
+	bool "boost-container"
+
 config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
 	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel \
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 56a6c34..7060591 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -28,6 +28,7 @@ BOOST_WITHOUT_FLAGS = coroutine
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
