From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Oct 2011 09:55:32 +0200
Subject: [Buildroot] [git commit] rpm: only show xz dependency comment if
	enabled
Message-ID: <20111011075632.862228E2F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f35348c3f6435e7e1a420fb07b335c1fd110aa46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpm/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 8d4c6a3..a80a5a7 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -15,16 +15,16 @@ config BR2_PACKAGE_RPM
 
 	  http://rpm5.org
 
+if BR2_PACKAGE_RPM
+
 config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
 	bool "support for bzip2 payloads"
-	depends on BR2_PACKAGE_RPM
 	select BR2_PACKAGE_BZIP2
 	help
 	  Support for bzip2 payloads in RPM.
 
 config BR2_PACKAGE_RPM_XZ_PAYLOADS
 	bool "support for xz payloads"
-	depends on BR2_PACKAGE_RPM
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Support for xz payloads in RPM.
@@ -32,4 +32,6 @@ config BR2_PACKAGE_RPM_XZ_PAYLOADS
 comment "xz payload support requires a toolchain with c++ support"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
+endif
+
 
