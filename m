From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  7 May 2015 09:35:26 +0300
Subject: [Buildroot] [PATCH] expedite: fix dependencies comment logic
Message-ID: <449494eb27dddced7fb68aa39d1fe2fad0aa8cd4.1430980526.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/efl/expedite/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/efl/expedite/Config.in b/package/efl/expedite/Config.in
index ddbf020f078c..1e121088ada8 100644
--- a/package/efl/expedite/Config.in
+++ b/package/efl/expedite/Config.in
@@ -12,5 +12,4 @@ config BR2_PACKAGE_EXPEDITE
 	  reproduce real world usage cases.
 
 comment "expedite needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.1.4
