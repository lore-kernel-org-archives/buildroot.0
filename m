From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 20 Feb 2019 14:29:11 -0600
Subject: [Buildroot] [PATCH] package/proftpd: require threads
Message-ID: <1550694551-61136-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/9c25c3cb3cf93b76c0538c5376a803641bf6575b

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/proftpd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index edec37c..d094b64 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PROFTPD
 	bool "proftpd"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  ProFTPD, a highly configurable FTP server.
 
@@ -89,3 +90,6 @@ config BR2_PACKAGE_PROFTPD_BUFFER_SIZE
 	  0 uses the default size of 1024.
 
 endif
+
+comment "proftpd needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
