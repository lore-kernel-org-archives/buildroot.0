From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:50 +0100
Subject: [Buildroot] [PATCH v6 28/28] package/qt5charts: Add optional
 dependency on qt5multimedia
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-29-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The audio example depends on it.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5charts/qt5charts.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 40f5efc2da..478cf9d6d8 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -24,4 +24,8 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5CHARTS_DEPENDENCIES += qt5declarative
 endif
 
+ifeq ($(BR2_PACKAGE_QT5MULTIMEDIA),y)
+QT5CHARTS_DEPENDENCIES += qt5multimedia
+endif
+
 $(eval $(qmake-package))
-- 
2.25.0
