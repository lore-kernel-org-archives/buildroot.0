From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2016 14:22:28 -0300
Subject: [Buildroot] [PATCH] bind: security bump to version 9.10.3-P4
Message-ID: <1457630548-3963-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-1285 - An error parsing input received by the rndc control
channel can cause an assertion failure in sexpr.c or alist.c
CVE-2016-1286 - A problem parsing resource record signatures for DNAME
resource records can lead to an assertion failure in resolver.c or db.c
CVE-2016-2088 - A response containing multiple DNS cookies causes
servers with cookie support enabled to exit with an assertion failure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index fea800c..cd76a54 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.10.3-P3/bind-9.10.3-P3.tar.gz.sha256.asc
-sha256	690810d1fbb72afa629e74638d19cd44e28d2b2e5eb63f55c705ad85d1a4cb83	bind-9.10.3-P3.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.10.3-P4/bind-9.10.3-P4.tar.gz.sha256.asc
+sha256	2ac044b5fbdf45fb45107af0df961b3b7cb5262a3bf1948ed3fe7a170dd13e3e	bind-9.10.3-P4.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 12dd52e..895217a 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.10.3-P3
+BIND_VERSION = 9.10.3-P4
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
-- 
2.4.10
