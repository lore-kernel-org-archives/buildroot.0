From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 9 Jan 2017 17:13:34 +0000
Subject: [Buildroot] [PATCH 2/2] php: bump version to 7.1.0 (security)
In-Reply-To: <20170109171334.57406-1-Vincent.Riera@imgtec.com>
References: <20170109171334.57406-1-Vincent.Riera@imgtec.com>
Message-ID: <20170109171334.57406-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed CVEs:
 - CVE-2016-9933 (imagefilltoborder stackoverflow on truecolor images)
   http://bugs.php.net/72696
 - CVE-2016-9934 (NULL Pointer Dereference in WDDX Packet
   Deserialization with PDORow)
   http://bugs.php.net/73331

Full ChangeLog:
  http://php.net/ChangeLog-7.php#7.1.0

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0424e46..5e4bdcb 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 0f1dff6392a1cc2ed126b9695f580a2ed77eb09d2c23b41cabfb41e6f27a8c89  php-7.0.14.tar.xz
+sha256 a810b3f29c21407c24caa88f50649320d20ba6892ae1923132598b8a0ca145b6  php-7.1.0.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index e8c8f4b..2ba70aa 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.0.14
+PHP_VERSION = 7.1.0
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.10.2
