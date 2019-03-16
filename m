From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 Mar 2019 13:02:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/biosdevname: bump to version 0.7.3
Message-ID: <20190316120230.12174-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site to github to get latest release
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/biosdevname/Config.in        | 2 +-
 package/biosdevname/biosdevname.hash | 3 ++-
 package/biosdevname/biosdevname.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/biosdevname/Config.in b/package/biosdevname/Config.in
index 704716791a..5cdf54268c 100644
--- a/package/biosdevname/Config.in
+++ b/package/biosdevname/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_BIOSDEVNAME
 	  system or hardware changes that might otherwise alter the
 	  typical ethX naming.
 
-	  http://linux.dell.com/biosdevname/
+	  https://github.com/dell/biosdevname/
diff --git a/package/biosdevname/biosdevname.hash b/package/biosdevname/biosdevname.hash
index 57946ea085..f4470c32dd 100644
--- a/package/biosdevname/biosdevname.hash
+++ b/package/biosdevname/biosdevname.hash
@@ -1,2 +1,3 @@
 # Locally computed hashes, not provided by upstream
-sha256 954575f482ff5de2d49c335b563990859a3eb3506e8fa976f6915eba870d71f6  biosdevname-0.7.2.tar.gz
+sha256 3a67fee0c315996bbba586c1c077e57625382d38dc48fb3c9e84d56a7a5effad  biosdevname-0.7.3.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/biosdevname/biosdevname.mk b/package/biosdevname/biosdevname.mk
index e0de8ef623..6036e24c09 100644
--- a/package/biosdevname/biosdevname.mk
+++ b/package/biosdevname/biosdevname.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BIOSDEVNAME_VERSION = 0.7.2
-BIOSDEVNAME_SITE = http://linux.dell.com/biosdevname/biosdevname-$(BIOSDEVNAME_VERSION)
+BIOSDEVNAME_VERSION = 0.7.3
+BIOSDEVNAME_SITE = $(call github,dell,biosdevname,v$(BIOSDEVNAME_VERSION))
 BIOSDEVNAME_LICENSE = GPL
 BIOSDEVNAME_LICENSE_FILES = COPYING
 BIOSDEVNAME_CONF_OPTS = --exec-prefix=/
-- 
2.14.1
