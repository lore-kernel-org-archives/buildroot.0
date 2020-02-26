From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 15:45:58 +0100
Subject: [Buildroot] [PATCH v2 27/37] package/qt5webkit-examples: drop qt
 5.6 support
In-Reply-To: <20200226144608.12529-1-peter@korsgaard.com>
References: <20200226144608.12529-1-peter@korsgaard.com>
Message-ID: <20200226144608.12529-27-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webkit-examples/qt5webkit-examples.hash | 3 ---
 package/qt5/qt5webkit-examples/qt5webkit-examples.mk   | 7 -------
 2 files changed, 10 deletions(-)

diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
index 0d48ecdffa..736dbef5e9 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/community_releases/5.6/5.6.3/qtwebkit-examples-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256  2d6ce7146298d03b443cca4390bbfee17c4c0b08a31efcbf9fe0732291a6169e  qtwebkit-examples-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-examples-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256  e4ce4de6b468243abad2baabbe8ddfb05d25b186529bfe88cb8662fc983f54d0  qtwebkit-examples-opensource-src-5.9.1.tar.xz
 
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index 94153fd652..6dab61d913 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -4,15 +4,8 @@
 #
 ################################################################################
 
-# no 5.10 package available, fall back to 5.9.1 version
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBKIT_EXAMPLES_VERSION = 5.9.1
 QT5WEBKIT_EXAMPLES_SITE = https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
-else
-QT5WEBKIT_EXAMPLES_VERSION = $(QT5_VERSION)
-QT5WEBKIT_EXAMPLES_SITE = https://download.qt.io/community_releases/5.6/$(QT5_VERSION)
-endif
-
 QT5WEBKIT_EXAMPLES_SOURCE = qtwebkit-examples-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_EXAMPLES_DEPENDENCIES = qt5base qt5webkit
 
-- 
2.20.1
