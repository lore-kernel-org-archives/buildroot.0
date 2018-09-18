From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 18 Sep 2018 23:34:03 +0200
Subject: [Buildroot] [PATCH 1/2] cppcms: fix license
Message-ID: <20180918213404.27239-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cppcms contains embedded third party software so add
THIRD_PARTY_SOFTWARE.TXT to CPPCMS_LICENSE_FILES as well as the
additional licenses to CPPCMS_LICENSE.
Also add hash for COPYING.TXT and THIRD_PARTY_SOFTWARE.TXT

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppcms/cppcms.hash | 2 ++
 package/cppcms/cppcms.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cppcms/cppcms.hash b/package/cppcms/cppcms.hash
index 28e998c6c1..6bfc680ac0 100644
--- a/package/cppcms/cppcms.hash
+++ b/package/cppcms/cppcms.hash
@@ -3,3 +3,5 @@ sha1	15f21897c14acfd4b0c74622e49d95857f2fe939	cppcms-1.0.5.tar.bz2
 md5	d668c201dd31fff8090380ebdc0bcc2b	cppcms-1.0.5.tar.bz2
 # Locally computed:
 sha256	84b685977bca97c3e997497f227bd5906adb80555066d811a7046b01c2f51865	cppcms-1.0.5.tar.bz2
+sha256	2ff22bab712c46dbadf9bae0f759bbc95d5d87614cacb7ebc3d5a50910603d6a	COPYING.TXT
+sha256	70fbf0194bee0f444c57ecd47e7d976a3e5a890e4421a21aab49f2d214267e69	THIRD_PARTY_SOFTWARE.TXT
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index f3ea2628ea..5fb6375d80 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -6,8 +6,8 @@
 
 CPPCMS_VERSION = 1.0.5
 CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
-CPPCMS_LICENSE = LGPL-3.0
-CPPCMS_LICENSE_FILES = COPYING.TXT
+CPPCMS_LICENSE = LGPL-3.0, BSL-1.0 (boost), MIT (base64.cpp), Public Domain (json2.js), Zlib (md5)
+CPPCMS_LICENSE_FILES = COPYING.TXT THIRD_PARTY_SOFTWARE.TXT
 CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
 CPPCMS_INSTALL_STAGING = YES
 CPPCMS_CXXFLAGS = $(TARGET_CXXFLAGS)
-- 
2.17.1
