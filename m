From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:15:32 +0100
Subject: [Buildroot] [git commit] dovecot: add missing indirect dependency
	on !avr32 for mysql
Message-ID: <20150207202910.715A98046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b7313439bf0109ddc43cd7cb0a73c5cd2772565
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
