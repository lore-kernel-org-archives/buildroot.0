From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 23:35:39 +0200
Subject: [Buildroot] [git commit] php-ssh2: bump version to 1.0
Message-ID: <20170601202901.F01987FDDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8930f9d03e322c09bc0fa707a80b0fe906cefcde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And switch to the official PECL site.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php-ssh2/php-ssh2.hash | 2 +-
 package/php-ssh2/php-ssh2.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/php-ssh2/php-ssh2.hash b/package/php-ssh2/php-ssh2.hash
index b514601..2529f9a 100644
--- a/package/php-ssh2/php-ssh2.hash
+++ b/package/php-ssh2/php-ssh2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3d79a6c9ffed3fd6ec16e834c0cc93cf125d9f5bdbb951b8b76a3507498548d5  php-ssh2-12dd52236c601577a63e33ee71e3ce6dad811e40.tar.gz
+sha256 6a93891878b23904a773eb814fec7aea4ea00b4a412ee779c8535ed9c5e46ced  ssh2-1.0.tgz
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index 931cde9..7a1372c 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PHP_SSH2_VERSION = 12dd52236c601577a63e33ee71e3ce6dad811e40
-PHP_SSH2_SITE = $(call github,php,pecl-networking-ssh2,$(PHP_SSH2_VERSION))
+PHP_SSH2_VERSION = 1.0
+PHP_SSH2_SOURCE = ssh2-$(PHP_SSH2_VERSION).tgz
+PHP_SSH2_SITE = https://pecl.php.net/get
 PHP_SSH2_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-ssh2=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
