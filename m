From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 20:07:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/qpdf: fix comment
Message-ID: <20200229190701.3340502-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 3f9bcc01b3ef94c8f138b6dccc861d9e222de5ef forgot to update comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qpdf/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index 6f586f651a..56a96e4f41 100644
--- a/package/qpdf/Config.in
+++ b/package/qpdf/Config.in
@@ -15,6 +15,6 @@ config BR2_PACKAGE_QPDF
 
 	  http://qpdf.sourceforge.net/
 
-comment "qpdf needs a toolchain w/ C++, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
+comment "qpdf needs a toolchain w/ C++, wchar, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.25.0
