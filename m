From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2020 23:20:52 +0100
Subject: [Buildroot] [PATCH 35/36] package/libmediaart: drop
 QT5_VERSION_LATEST logic
In-Reply-To: <20200224222054.2686-1-peter@korsgaard.com>
References: <20200224222054.2686-1-peter@korsgaard.com>
Message-ID: <20200224222054.2686-35-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the version selection has been removed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmediaart/libmediaart.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index a81542ac69..4933b74c19 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -22,9 +22,7 @@ LIBMEDIAART_CONF_OPTS += \
 	--disable-qt
 else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_QT),y)
 # qt5 needs c++11 (since qt-5.7)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
-endif
 LIBMEDIAART_DEPENDENCIES += qt5base
 LIBMEDIAART_CONF_OPTS += \
 	--disable-gdkpixbuf \
-- 
2.20.1
