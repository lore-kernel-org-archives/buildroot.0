From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Jun 2014 08:57:12 -0300
Subject: [Buildroot] [PATCHv2] rpm: needs mmu
Message-ID: <1401710232-29781-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/7fa/7fa2bd8e464c6708095ec4038b6f3d534b10dd82/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rpm/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index de06141..2492616 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,9 +1,11 @@
 comment "rpm needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 
 config BR2_PACKAGE_RPM
 	bool "rpm"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_OPENSSL
-- 
1.8.5.5
