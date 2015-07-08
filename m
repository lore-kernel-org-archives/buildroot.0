From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Jul 2015 13:52:15 -0300
Subject: [Buildroot] [PATCH] bind: security bump to version 9.9.7-P1
Message-ID: <1436374335-28647-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-4620 - On servers configured to perform DNSSEC validation an
assertion failure could be triggered on answers from a specially
configured server.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 6bbd00f..e74c773 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.9.7/bind-9.9.7.tar.gz.sha256.asc
-sha256	3f23e7fcb363a2594ed1f065868c2c1080a93636a4fcb4c47f9e164e2cd74c66	bind-9.9.7.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.9.7-P1/bind-9.9.7-P1.tar.gz.sha256.asc
+sha256	bd086ff58afaf03cfb8dc695c79b6bd6d0217ef56750a78ff0668b2b3acda34d	bind-9.9.7-P1.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 9a08461..98a19ea 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.9.7
+BIND_VERSION = 9.9.7-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
-- 
2.3.6
