From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Apr 2013 08:11:53 -0300
Subject: [Buildroot] [PATCH] linknx: needs mmu
Message-ID: <1364987513-11433-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Inherited from libpthsem which uses fork()

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linknx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index 18e9867..f35351e 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LINKNX
 	bool "linknx"
 	select BR2_PACKAGE_LIBPTHSEM
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # libpthsem
 	help
 	  Linknx is an automation platform providing high level functionalities
 	  to EIB/KNX installation.
-- 
1.8.1.5
