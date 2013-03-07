From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:40 +0100
Subject: [Buildroot] [PATCH 12/32] qt5base: support debug or release modes
In-Reply-To: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362687540-19440-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index cad7b8d..33555ae 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -41,6 +41,12 @@ QT5BASE_CONFIGURE_OPTS += \
 	-system-pcre \
 	-no-pch
 
+ifeq ($(BR2_ENABLE_DEBUG),y)
+QT5BASE_CONFIGURE_OPTS += -debug
+else
+QT5BASE_CONFIGURE_OPTS += -release
+endif
+
 ifeq ($(BR2_LARGEFILE),y)
 QT5BASE_CONFIGURE_OPTS += -largefile
 else
-- 
1.7.9.5
