From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Nov 2018 14:55:32 +0100
Subject: [Buildroot] [PATCH] squid: security bump to version 4.4
Message-ID: <20181109135533.18802-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes SQUID-2018_4:

Due to incorrect input handling, Squid is vulnerable to a Cross-Site
Scripting vulnerability when generating HTTPS response messages about TLS
errors.

For more details, see the advisory:

http://www.squid-cache.org/Advisories/SQUID-2018_4.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 195477359a..5e872707ce 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.3.tar.xz.asc
-md5 ebb67abaec4db9d298c0edd8e1ffaca4 squid-4.3.tar.xz
-sha1 690540e7d0904e3959557f8beca45dbac1c94578 squid-4.3.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.4.tar.xz.asc
+md5 892504ca9700e1f139a53f84098613bd squid-4.4.tar.xz
+sha1 0ab6b133f65866d825bf72cbbe8cef209768b2fa squid-4.4.tar.xz
 # Locally calculated
-sha256 322612ef0544828f6c673a25124b32364fb41ef5e2847e21c89480b5546a4c7c squid-4.3.tar.xz
+sha256 4905e6da7f5574d2583ba36f398bb062a12d51e70d67035078b6e85b09e9ee82 squid-4.4.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 9335615559..b661d5d133 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.3
+SQUID_VERSION = 4.4
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
-- 
2.11.0
