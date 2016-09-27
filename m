From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Sep 2016 16:43:53 +0200
Subject: [Buildroot] [git commit] python-pyqt5: hide comment when Qt is
	enabled
Message-ID: <20160927144443.F1CB981D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b62fdfdc274e592675a4894b893841991e72c913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the main python-pyqt5 option is not visible when BR2_PACKAGE_QT
is enabled, the comment should also not be visibled when
BR2_PACKAGE_QT is enabled.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyqt5/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
index 319525a..4eca68a 100644
--- a/package/python-pyqt5/Config.in
+++ b/package/python-pyqt5/Config.in
@@ -1,4 +1,5 @@
 comment "python-pyqt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
+	depends on !BR2_PACKAGE_QT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
