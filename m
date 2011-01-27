From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jan 2011 23:38:48 +0100
Subject: [Buildroot] [git commit master 1/1] host-python: enable expat
	support
Message-ID: <20110127224051.C40978D348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5a7192b25349e3e046ccadc1926062ffbf69cc9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages (like libxcb) need xml support in host-python in order to
build (.py file tries to import xml.etree.cElementTree).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python/python.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 4b80538..c2839b7 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -18,7 +18,7 @@ HOST_PYTHON_CONF_OPT += 	\
 	--without-cxx-main 	\
 	--disable-sqlite3	\
 	--disable-tk		\
-	--with-expat=none	\
+	--with-expat=system	\
 	--disable-curses	\
 	--disable-codecs-cjk	\
 	--disable-nis		\
@@ -39,6 +39,8 @@ HOST_PYTHON_AUTORECONF = YES
 
 PYTHON_DEPENDENCIES  = host-python libffi
 
+HOST_PYTHON_DEPENDENCIES = host-expat
+
 PYTHON_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
-- 
1.7.3.4
