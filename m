From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Feb 2012 20:51:24 +0100
Subject: [Buildroot] [git commit] libecore: add optional
	tslib/glib/openssl/gnutls/curl support
Message-ID: <20120212195611.569A590A6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=832068e494c8387c209905d2aa18b24d0d7d7116
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libecore/libecore.mk |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 5bc6532..8c46269 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -17,6 +17,26 @@ HOST_LIBECORE_CONF_OPT += --enable-ecore-evas
 # default options
 LIBECORE_CONF_OPT = --disable-simple-x11
 
+ifeq ($(BR2_PACKAGE_TSLIB),y)
+LIBECORE_DEPENDENCIES += tslib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+LIBECORE_DEPENDENCIES += libglib2
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBECORE_DEPENDENCIES += openssl
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBECORE_DEPENDENCIES += gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBECORE_DEPENDENCIES += libcurl
+endif
+
 # libecore
 ifeq ($(BR2_PACKAGE_LIBECORE_DIRECTFB),y)
 LIBECORE_CONF_OPT += --enable-ecore-directfb
