From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  9 Feb 2017 19:00:31 +0100
Subject: [Buildroot] [PATCH v1] qt5: latest/5.8.0 needs c++11 host compiler
	support
Message-ID: <20170209180031.23868-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 692943433..c3560c377 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -37,12 +37,13 @@ choice
 config BR2_QT5_VERSION_LATEST
 	bool "Latest (5.8)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	help
 	  This option builds Qt 5.8, which is licensed under
 	  (L)GPLv3+.
 
-comment "Latest Qt version needs toolchain w/ gcc >= 4.8"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
 
 config BR2_QT5_VERSION_5_6
 	bool "LTS (5.6)"
-- 
2.11.0
