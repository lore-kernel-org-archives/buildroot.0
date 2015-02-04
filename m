From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:11 +0100
Subject: [Buildroot] [PATCH 13/21] dovecot: add missing indirect dependency
	on !avr32 for mysql
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-14-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dovecot/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 17c914d..aa4c221 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -22,13 +22,15 @@ config BR2_PACKAGE_DOVECOT_BZIP2
 config BR2_PACKAGE_DOVECOT_MYSQL
 	bool "mysql support"
 	select BR2_PACKAGE_MYSQL
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP # mysql
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	depends on !BR2_avr32 # mysql
 	help
 	  Enable MySQL support.
 
 comment "mysql support needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_avr32
 
 config BR2_PACKAGE_DOVECOT_OPENSSL
 	bool "openssl support"
-- 
2.1.4
