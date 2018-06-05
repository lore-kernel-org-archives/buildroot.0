From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Jun 2018 11:11:08 +0200
Subject: [Buildroot] [PATCH] package/mono> fixing licenses hashes
Message-ID: <1528189868-4119-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds hashes for the licensing files and removes a file
no more present.

Fixes:
http://autobuild.buildroot.net/results/c69e55a3f7539ff65aaf57c96f52ebea7e456e48/

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mono/mono.hash | 3 +++
 package/mono/mono.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 47e3442..2cde7b6 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,5 @@
 # sha256 locally computed
 sha256 f0636baa0c1399805526142e799cb697ddccf736e506cf1a30a870eaa2830a89  mono-5.12.0.226.tar.bz2
+sha256 3b40a54878b5ac2767a764bd082f8772ab27c03b9da9c7328c4c4935725556f7  LICENSE
+sha256 fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
+sha256 2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 2d60fc6..d1fe9bb 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -8,7 +8,7 @@ MONO_VERSION = 5.12.0.226
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
-MONO_LICENSE_FILES = LICENSE mcs/COPYING eglib/COPYING \
+MONO_LICENSE_FILES = LICENSE mcs/COPYING \
 	external/Newtonsoft.Json/Tools/7-zip/copying.txt
 MONO_INSTALL_STAGING = YES
 
-- 
2.7.4
