From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 01:00:26 +0200
Subject: [Buildroot] [git commit] php: security bump to version 5.6.11
Message-ID: <20150710230034.E3E3A8194F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ddda416accf7465e048a330f2b458f21600abbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-3152 - mysqlnd is vulnerable to BACKRONYM

And other security bugs with no CVE assigned yet:
Bug #69972 - Use-after-free vulnerability in
sqlite3SafetyCheckSickOrOk()
Bug # 69970 - Use-after-free vulnerability in
spl_recursive_it_move_forward_ex()

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash |    2 +-
 package/php/php.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 4abf45e..ea12138 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	1af720c955b0a57aa47606e928616e84c78868aff2a5f269c70601a77d6da8c1	php-5.6.10.tar.xz
+sha256	3f97dbb1c646b90e1ef638defabe429ef036f903b5baa1c34769d3de4fe62bd4	php-5.6.11.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index afac950..53aaecf 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).10
+PHP_VERSION = $(PHP_VERSION_MAJOR).11
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
