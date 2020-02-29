From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 20:25:34 +0100
Subject: [Buildroot] [git commit] package/qpdf: fix comment
Message-ID: <20200229191339.A04688EF90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03cb3f61a01dd014dc475e7054ada5af313b2eaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3f9bcc01b3ef94c8f138b6dccc861d9e222de5ef forgot to update comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
