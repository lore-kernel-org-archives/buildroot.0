From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 21:57:15 +0200
Subject: [Buildroot] [PATCHv5 01/14] qt5: disallow the selection of Qt4 and
	Qt5
In-Reply-To: <1365364648-30568-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365364648-30568-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365364648-30568-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noticed by Arnout, Qt4 and Qt5 cannot be installed together,
because for example the qt.conf installed by one version cannot be
understood by the qmake of another version. We therefore make them
mutually exclusive, which sounds reasonable for the embedded systems
targeted by Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 1c9f8a6..9e9104a 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -7,6 +7,7 @@ menuconfig BR2_PACKAGE_QT5
 	depends on BR2_USE_WCHAR
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_QT
 	help
 	  This option enables the Qt5 framework. Sub-options allow to
 	  select which modules should be built.
-- 
1.7.9.5
