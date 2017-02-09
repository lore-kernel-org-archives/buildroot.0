From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Feb 2017 19:50:36 +0100
Subject: [Buildroot] [git commit] qt5: latest/5.8.0 needs c++11 host
	compiler support
Message-ID: <20170209185423.D0DFF8028B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3a4c386e432c616b373a6bb3de830456a43c342
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 6929434..c3560c3 100644
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
