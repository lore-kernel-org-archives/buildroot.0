From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Dec 2014 08:34:51 -0300
Subject: [Buildroot] [PATCH] bind: security bump to version 9.9.6-P1
Message-ID: <1418124891-3773-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-8500 - A flaw in delegation handling could be exploited
to put named into an infinite loop, in which each lookup of a name
server triggered additional lookups of more name servers.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 9cf9801..d715e54 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.9.6/bind-9.9.6.tar.gz.*.asc
-sha256	6b9432644a3bfa41695354543bd9e2547104e35f3c7354a416a030a4cdd1c514	bind-9.9.6.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.9.6-P1/bind-9.9.6-P1.tar.gz.sha256.asc
+sha256	dfedcb2b414d2803accd1a9c21d183178a288f40a2486af5ec0d3369a8cb8526	bind-9.9.6-P1.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 06c6601..6c17b13 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.9.6
+BIND_VERSION = 9.9.6-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
-- 
2.0.4
