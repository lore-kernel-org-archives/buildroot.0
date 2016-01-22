From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jan 2016 09:28:11 -0300
Subject: [Buildroot] [PATCH] bind: security bump to version 9.10.3-P3
Message-ID: <1453465691-24718-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

CVE-2015-8704 - apl_42.c in ISC BIND 9.x before 9.9.8-P3 and 9.9.x and
9.10.x before 9.10.3-P3 allows remote authenticated users to cause a
denial of service (INSIST assertion failure and daemon exit) via a
malformed Address Prefix List (APL) record.

CVE-2015-8705 - buffer.c in named in ISC BIND 9.10.x before 9.10.3-P3,
when debug logging is enabled, allows remote attackers to cause a denial
of service (REQUIRE assertion failure and daemon exit, or daemon crash)
or possibly have unspecified other impact via (1) OPT data or (2) an ECS
option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index ae71bd1..fea800c 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.10.3-P2/bind-9.10.3-P2.tar.gz.sha256.asc
-sha256	4a6c1911ac0d4b6be635b63de3429b6c168ea244043f12bbc8a4eb3368fd6ecd	bind-9.10.3-P2.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.10.3-P3/bind-9.10.3-P3.tar.gz.sha256.asc
+sha256	690810d1fbb72afa629e74638d19cd44e28d2b2e5eb63f55c705ad85d1a4cb83	bind-9.10.3-P3.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index f74774b..a5b571a 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.10.3-P2
+BIND_VERSION = 9.10.3-P3
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
-- 
2.4.10
