From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 22:54:32 +0200
Subject: [Buildroot] [git commit] qt5: Need pcre with UTF support
Message-ID: <20140727205438.18AFF9D2BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24a9da81dfa9563be87abd5667389f42c3c950e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enabling PCRE16 is not enough for Qt5. PCREUTF is also necessary, else
Qt5 may complain with this kind of (non fatal) message:
  QRegularExpressionPrivate::doMatch(): called on an invalid QRegularExpression object

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index fe742f3..b95a74a 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_16
+	select BR2_PACKAGE_PCRE_UTF
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
