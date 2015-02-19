From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 Feb 2015 08:52:25 -0300
Subject: [Buildroot] [PATCH] bind: security bump to version 9.9.6-P2
Message-ID: <1424346745-4643-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2015-1349 - Revoking a managed trust anchor and supplying an
untrusted replacement could cause namedto crash with an assertion
failure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index d715e54..aac0a84 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.9.6-P1/bind-9.9.6-P1.tar.gz.sha256.asc
-sha256	dfedcb2b414d2803accd1a9c21d183178a288f40a2486af5ec0d3369a8cb8526	bind-9.9.6-P1.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.9.6-P2/bind-9.9.6-P2.tar.gz.sha256.asc
+sha256	5e882f453a8c799a121272f68bdb90936ce97bb857f8c2b3af1c8ba3d1b749ed	bind-9.9.6-P2.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index a98a4c4..ad41330 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.9.6-P1
+BIND_VERSION = 9.9.6-P2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
-- 
2.0.5
