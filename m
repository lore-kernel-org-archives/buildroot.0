From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Jun 2014 08:36:43 -0300
Subject: [Buildroot] [PATCH] rpm: needs mmu
Message-ID: <1401709003-29184-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/7fa/7fa2bd8e464c6708095ec4038b6f3d534b10dd82/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rpm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index de06141..95cda38 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -4,6 +4,7 @@ comment "rpm needs a toolchain w/ threads"
 config BR2_PACKAGE_RPM
 	bool "rpm"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_OPENSSL
-- 
1.8.5.5
