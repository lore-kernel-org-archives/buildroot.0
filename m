From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Jan 2017 09:11:26 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] php: bump version to
	7.1.0 (security)
Message-ID: <20170112081250.DD35A7FF33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f4c1ac310db1f5681501cec79bf76dea47f0b41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixed CVEs:
 - CVE-2016-9933 (imagefilltoborder stackoverflow on truecolor images)
   http://bugs.php.net/72696
 - CVE-2016-9934 (NULL Pointer Dereference in WDDX Packet
   Deserialization with PDORow)
   http://bugs.php.net/73331

Full ChangeLog:
  http://php.net/ChangeLog-7.php#7.1.0

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e470b3fde7fe7e69fc5ec57fe8a5c8a4cd66c8cc)
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
index 8c1ccef..42d8513 100644
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
