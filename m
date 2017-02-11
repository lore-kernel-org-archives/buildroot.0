From: Andreas Naumann <anaumann@ultratronik.de>
Date: Sat, 11 Feb 2017 12:05:31 +0100
Subject: [Buildroot] [PATCH v2 3/3] poppler: qt5 support needs c++11 (since
	Qt5.7)
In-Reply-To: <1486811131-6172-1-git-send-email-anaumann@ultratronik.de>
References: <1486811131-6172-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1486811131-6172-4-git-send-email-anaumann@ultratronik.de>
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
index 022c2c5..fda8284 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -90,6 +90,10 @@ endif
 ifeq ($(BR2_PACKAGE_POPPLER_QT5),y)
 POPPLER_DEPENDENCIES += qt5base
 POPPLER_CONF_OPTS += --enable-poppler-qt5
+# since Qt5.7.x c++11 is needed (LTS Qt5.6.x is the last one without this requirement)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+POPPLER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+endif
 else
 POPPLER_CONF_OPTS += --disable-poppler-qt5
 endif
-- 
1.9.1
