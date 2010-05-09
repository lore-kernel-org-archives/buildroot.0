From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 May 2010 23:26:43 +0200
Subject: [Buildroot] [PATCH 9/9] ltp-testsuite: mark as broken
In-Reply-To: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1fd6bd2a4cc3faff672265e78ed4d5f863be8908.1273440344.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The install step, done with fakeroot, tries to install things in /opt:

make[2]: Entering directory `/home/test/buildroot/output.ctng-arm-eglibc-2010-05-07-19-39-56/target/root/ltp-full-20090630/lib'
install -D -m 644 libltp.a //opt/ltp/lib/libltp.a
install: cannot create directory //opt/ltp: Permission denied
make[2]: *** [install] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/Config.in              |    1 +
 package/shared-mime-info/shared-mime-info.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 46c8221..efe0db7 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LTP-TESTSUITE
 	bool "ltp-testsuite"
+	depends on BROKEN
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index fe14142..487d4b2 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -16,7 +16,7 @@ SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-libglib2 host-libxml2 host-
 
 SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
 
-HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config
+HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-intltool
 
 HOST_SHARED_MIME_INFO_CONF_OPT = \
 	--disable-update-mimedb
-- 
1.6.3.3
