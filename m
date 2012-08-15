From: Stefan Froberg <stefan.froberg@petroprogram.com>
Date: Wed, 15 Aug 2012 22:00:26 +0300
Subject: [Buildroot] [PATCH] python: firefox host-python dependency needs
	--enable-unicodedata
In-Reply-To: <1345057226-18726-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1345057226-18726-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1345057226-18726-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
---
 package/python/python.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index fae4e5c..805e40c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -22,7 +22,6 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-curses	\
 	--disable-codecs-cjk	\
 	--disable-nis		\
-	--disable-unicodedata	\
 	--disable-dbm		\
 	--disable-gdbm		\
 	--disable-bsddb		\
@@ -30,6 +29,13 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-bz2		\
 	--disable-ssl
 
+ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
+	HOST_PYTHON_CONF_OPT += --disable-unicodedata	
+else
+	HOST_PYTHON_CONF_OPT += --enable-unicodedata
+endif
+
+
 HOST_PYTHON_MAKE_ENV = \
 	PYTHON_MODULES_INCLUDE=$(HOST_DIR)/usr/include \
 	PYTHON_MODULES_LIB="$(HOST_DIR)/lib $(HOST_DIR)/usr/lib"
-- 
1.7.7.6
