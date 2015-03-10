From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2015 20:59:40 +0100
Subject: [Buildroot] [PATCH v3 4/8] bandwidthd: remove postgresql introduced
	uclibc dependency
In-Reply-To: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
References: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
Message-ID: <1426017584-6096-4-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 --> v2:
  - added (thanks to Baruch Siach for the hint)
---
 package/bandwidthd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index c1f0ee1..0d51f5e 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -32,7 +32,6 @@ if BR2_PACKAGE_BANDWIDTHD
 
 config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	bool "enable postgresql log target support"
-	depends on BR2_TOOLCHAIN_USES_GLIBC # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Enable support for logging the bandwidthd data to a remote
-- 
2.1.4
