From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Jan 2021 22:44:56 +0100
Subject: [Buildroot] [PATCH 2/2] package/socat: security bump to version
 1.7.4.1
In-Reply-To: <20210127214456.3402995-1-fontaine.fabrice@gmail.com>
References: <20210127214456.3402995-1-fontaine.fabrice@gmail.com>
Message-ID: <20210127214456.3402995-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buffer size option (-b) is internally doubled for CR-CRLF conversion,
but not	checked for integer overflow. This could lead to heap based
buffer overflow, assuming the attacker could provide this parameter.

- Update indentation in hash file (two spaces)
- Update hash of README file due to minor updates:
  https://repo.or.cz/socat.git/commit/b145170837d75bd7a1a5803283910ab075d47bea
  https://repo.or.cz/socat.git/commit/0a115feadc3102f17e0a8a1a985319af0295f704

http://www.dest-unreach.org/socat/doc/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/socat/socat.hash | 10 +++++-----
 package/socat/socat.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index e5b65925d1..5a4c520455 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5	3cca4f8cd9d2d1caabd9cc099451bac9	socat-1.7.3.4.tar.bz2
+md5  36cad050ecf4981ab044c3fbd75c643f  socat-1.7.4.1.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256	972374ca86f65498e23e3259c2ee1b8f9dbeb04d12c2a78c0c9b5d1cb97dfdfc	socat-1.7.3.4.tar.bz2
+sha256  3faca25614e89123dff5045680549ecef519d02e331aaf3c4f5a8f6837c675e9  socat-1.7.4.1.tar.bz2
 # Locally calculated
-sha256	4846488cea98a2905dc75b7aa5eea721568e372447efe06b85bd896ee8c54f10	README
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
-sha256	fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761	COPYING.OpenSSL
+sha256  b1ebebbce145027f4268211f36d121b083aeeabdc1736eb144b8afd8e86ce8da  README
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index aedc21c3e3..61c9852565 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.7.3.4
+SOCAT_VERSION = 1.7.4.1
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
-- 
2.29.2
