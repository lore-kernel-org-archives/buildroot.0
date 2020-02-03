From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 14:07:12 +0100
Subject: [Buildroot] [git commit] package/qt5webkit: convert patch to git
 format and re-number
Message-ID: <20200203125754.5BE3D88097@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=185855709dfb24371912b98d680127e8fb3b50e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Convert patch 0005-Fix-installation-of-class-headers.patch to git
format and re-number it to 0004-Fix-installation-of-class-headers.patch.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...> 0004-Fix-installation-of-class-headers.patch} | 32 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/package/qt5/qt5webkit/5.9.1/0005-Fix-installation-of-class-headers.patch b/package/qt5/qt5webkit/5.9.1/0004-Fix-installation-of-class-headers.patch
similarity index 85%
rename from package/qt5/qt5webkit/5.9.1/0005-Fix-installation-of-class-headers.patch
rename to package/qt5/qt5webkit/5.9.1/0004-Fix-installation-of-class-headers.patch
index abddfe5d14..92aab57111 100644
--- a/package/qt5/qt5webkit/5.9.1/0005-Fix-installation-of-class-headers.patch
+++ b/package/qt5/qt5webkit/5.9.1/0004-Fix-installation-of-class-headers.patch
@@ -1,4 +1,10 @@
-Fix installation of class headers
+From 7d763d441fd4fa78553a818ee75ac477eb6dbcbe Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Sun, 2 Feb 2020 10:48:50 +0100
+Subject: [PATCH] Fix installation of class headers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Since Qt 5.11 (see commit [1]), the key word HEADER_CLASSES has been
 removed. It has been replaced by a new variable GENERATED_HEADER_FILES.
@@ -9,9 +15,17 @@ HEADER_FILES.
 [1]: https://github.com/qt/qtbase/commit/9c4c136bc9f29bab1cc9684dfced55a92a8bbe96
 
 Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
-diff -Nurd qtwebkit-opensource-src-5.9.1.orig/include/QtWebKit/headers.pri qtwebkit-opensource-src-5.9.1/include/QtWebKit/headers.pri
---- qtwebkit-opensource-src-5.9.1.orig/include/QtWebKit/headers.pri	2018-06-29 09:21:06.395038976 -0400
-+++ qtwebkit-opensource-src-5.9.1/include/QtWebKit/headers.pri	2018-06-29 17:37:52.500020060 -0400
+[Converted to git formated patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ include/QtWebKit/headers.pri        | 3 +--
+ include/QtWebKitWidgets/headers.pri | 3 +--
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/include/QtWebKit/headers.pri b/include/QtWebKit/headers.pri
+index 6775f3a6..3a5c14cd 100644
+--- a/include/QtWebKit/headers.pri
++++ b/include/QtWebKit/headers.pri
 @@ -1,5 +1,4 @@
 -SYNCQT.HEADER_FILES = WebKit/qt/Api/qwebdatabase.h WebKit/qt/Api/qwebelement.h WebKit/qt/Api/qwebhistory.h WebKit/qt/Api/qwebhistoryinterface.h WebKit/qt/Api/qwebkitglobal.h WebKit/qt/Api/qwebkitplatformplugin.h WebKit/qt/Api/qwebpluginfactory.h WebKit/qt/Api/qwebsecurityorigin.h WebKit/qt/Api/qwebsettings.h ../include/QtWebKit/qtwebkitversion.h ../include/QtWebKit/QtWebKit 
 -SYNCQT.HEADER_CLASSES = ../include/QtWebKit/QWebDatabase ../include/QtWebKit/QWebElement ../include/QtWebKit/QWebElementCollection ../include/QtWebKit/QWebHistoryItem ../include/QtWebKit/QWebHistory ../include/QtWebKit/QWebHistoryInterface ../include/QtWebKit/QWebSelectData ../include/QtWebKit/QWebSelectMethod ../include/QtWebKit/QWebNotificationData ../include/QtWebKit/QWebNotificationPresenter ../include/QtWebKit/QWebHapticFeedbackPlayer ../include/QtWebKit/QWebTouchModifier ../include/QtWebKit/QWebFullScreenVideoHandler ../include/QtWebKit/QWebSpellChecker ../include/QtWebKit/QWebKitPlatformPlugin ../include/QtWebKit/QWebPluginFactory ../include/QtWebKit/QWebSecurityOrigin ../include/QtWebKit/QWebSettings ../include/QtWebKit/QtWebKitVersion 
@@ -19,9 +33,10 @@ diff -Nurd qtwebkit-opensource-src-5.9.1.orig/include/QtWebKit/headers.pri qtweb
  SYNCQT.PRIVATE_HEADER_FILES = WebKit/qt/Api/qhttpheader_p.h WebKit/qt/Api/qwebdatabase_p.h WebKit/qt/Api/qwebelement_p.h WebKit/qt/Api/qwebhistory_p.h WebKit/qt/Api/qwebplugindatabase_p.h WebKit/qt/Api/qwebscriptworld.h WebKit/qt/Api/qwebscriptworld_p.h WebKit/qt/Api/qwebsecurityorigin_p.h WebKit2/UIProcess/API/qt/qquicknetworkreply_p.h WebKit2/UIProcess/API/qt/qquicknetworkrequest_p.h WebKit2/UIProcess/API/qt/qquickurlschemedelegate_p.h WebKit2/UIProcess/API/qt/qquickwebpage_p.h WebKit2/UIProcess/API/qt/qquickwebpage_p_p.h WebKit2/UIProcess/API/qt/qquickwebview_p.h WebKit2/UIProcess/API/qt/qquickwebview_p_p.h WebKit2/UIProcess/API/qt/qtwebsecurityorigin_p.h WebKit2/UIProcess/API/qt/qwebchannelwebkittransport_p.h WebKit2/UIProcess/API/qt/qwebdownloaditem_p.h WebKit2/UIProcess/API/qt/qwebdownloaditem_p_p.h WebKit2/UIProcess/API/qt/qwebiconimageprovider_p.h WebKit2/UIProcess/API/qt/qwebkittest_p.h WebKit2/UIProcess/API/qt/qwebloadrequest_p.h WebKit2/UIProcess/API/qt/qwebnavig
 ationhis
 tory_p.h WebKit2/UIProcess/API/qt/qwebnavigationhistory_p_p.h WebKit2/UIProcess/API/qt/qwebnavigationrequest_p.h WebKit2/UIProcess/API/qt/qwebpermissionrequest_p.h WebKit2/UIProcess/API/qt/qwebpreferences_p.h WebKit2/UIProcess/API/qt/qwebpreferences_p_p.h WebKit2/UIProcess/API/qt/raw/qrawwebview_p.h WebKit2/UIProcess/API/qt/raw/qrawwebview_p_p.h WebKit2/UIProcess/API/qt/tests/bytearraytestdata.h WebKit2/UIProcess/API/qt/tests/testwindow.h WebKit2/UIProcess/API/qt/tests/util.h 
  SYNCQT.INJECTED_PRIVATE_HEADER_FILES = 
  SYNCQT.QPA_HEADER_FILES = 
-diff -Nurd qtwebkit-opensource-src-5.9.1.orig/include/QtWebKitWidgets/headers.pri qtwebkit-opensource-src-5.9.1/include/QtWebKitWidgets/headers.pri
---- qtwebkit-opensource-src-5.9.1.orig/include/QtWebKitWidgets/headers.pri	2018-06-29 09:21:06.391705602 -0400
-+++ qtwebkit-opensource-src-5.9.1/include/QtWebKitWidgets/headers.pri	2018-06-29 17:38:47.660648435 -0400
+diff --git a/include/QtWebKitWidgets/headers.pri b/include/QtWebKitWidgets/headers.pri
+index 9d386e29..2b8b095c 100644
+--- a/include/QtWebKitWidgets/headers.pri
++++ b/include/QtWebKitWidgets/headers.pri
 @@ -1,5 +1,4 @@
 -SYNCQT.HEADER_FILES = WebKit/qt/WidgetApi/qgraphicswebview.h WebKit/qt/WidgetApi/qwebframe.h WebKit/qt/WidgetApi/qwebinspector.h WebKit/qt/WidgetApi/qwebpage.h WebKit/qt/WidgetApi/qwebview.h ../include/QtWebKitWidgets/qtwebkitwidgetsversion.h ../include/QtWebKitWidgets/QtWebKitWidgets 
 -SYNCQT.HEADER_CLASSES = ../include/QtWebKitWidgets/QGraphicsWebView ../include/QtWebKitWidgets/QWebHitTestResult ../include/QtWebKitWidgets/QWebFrame ../include/QtWebKitWidgets/QWebInspector ../include/QtWebKitWidgets/QWebPage ../include/QtWebKitWidgets/QWebView ../include/QtWebKitWidgets/QtWebKitWidgetsVersion 
@@ -29,3 +44,6 @@ diff -Nurd qtwebkit-opensource-src-5.9.1.orig/include/QtWebKitWidgets/headers.pr
  SYNCQT.PRIVATE_HEADER_FILES = WebKit/qt/WidgetApi/qwebframe_p.h WebKit/qt/WidgetApi/qwebinspector_p.h WebKit/qt/WidgetApi/qwebpage_p.h WebKit/qt/WidgetApi/qwebviewaccessible_p.h 
  SYNCQT.INJECTED_PRIVATE_HEADER_FILES = 
  SYNCQT.QPA_HEADER_FILES = 
+-- 
+2.25.0
+
