From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Mar 2017 22:07:16 +0200
Subject: [Buildroot] [git commit] libmediaart: fix qt5 build
Message-ID: <20170330200720.34DE882668@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7298d02ccc240d1dfd853ab4be3badb5e490fe97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use BR2_PACKAGE_QT5_VERSION_LATEST instead of BR2_QT5_VERSION_LATEST

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmediaart/libmediaart.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 31f5675..0f1a0f3 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -22,7 +22,7 @@ LIBMEDIAART_CONF_OPTS += \
 	--disable-qt
 else ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_QT),y)
 # qt5 needs c++11 (since qt-5.7)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 endif
 LIBMEDIAART_DEPENDENCIES += \
