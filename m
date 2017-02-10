From: Andreas Naumann <anaumann@ultratronik.de>
Date: Fri, 10 Feb 2017 14:59:58 +0100
Subject: [Buildroot] [PATCH 2/2] poppler: qt5 support needs c++11 (since
	Qt5.7)
In-Reply-To: <1486735198-29936-1-git-send-email-anaumann@ultratronik.de>
References: <1486735198-29936-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1486735198-29936-3-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/poppler/poppler.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 022c2c5..29c79d7 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -90,6 +90,10 @@ endif
 ifeq ($(BR2_PACKAGE_POPPLER_QT5),y)
 POPPLER_DEPENDENCIES += qt5base
 POPPLER_CONF_OPTS += --enable-poppler-qt5
+# since Qt5.7.x c++11 is needed (LTS Qt5.6.x is the last one without this requirement)
+ifneq ($(BR2_QT5_VERSION_5_6),y)
+POPPLER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+endif
 else
 POPPLER_CONF_OPTS += --disable-poppler-qt5
 endif
-- 
1.9.1
