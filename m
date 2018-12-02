From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Dec 2018 15:04:17 +0100
Subject: [Buildroot] [PATCH 2/2] package/qt5: hide for toolchains with
 binutils bug 20765
In-Reply-To: <cover.1543759351.git.yann.morin.1998@free.fr>
References: <cover.1543759351.git.yann.morin.1998@free.fr>
Message-ID: <acc8229480af3087d4df4da9b306ddc8e76be1ef.1543759351.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/5b9/5b9ef3c4bc5640b1c7e38a941e343fba75bf4742/
    http://autobuild.buildroot.org/results/df0/df0dab779213cf1ec3e511360bcc84f8856576b2/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pinentry/Config.in | 1 +
 package/qt5/Config.in      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 5f2cb58fbb..97702f032f 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -64,6 +64,7 @@ config BR2_PACKAGE_PINENTRY_QT5
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_PACKAGE_PINENTRY_QT4
 	depends on !BR2_PACKAGE_QT
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20765 # qt5
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 735824402e..f1436deff0 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -22,6 +22,7 @@ menuconfig BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_PACKAGE_QT
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20765
 	select BR2_PACKAGE_QT5BASE
 	help
 	  This option enables the Qt5 framework. Sub-options allow to
-- 
2.14.1
