From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Sep 2014 15:26:29 -0300
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.2.18
Message-ID: <1411064789-19370-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash, calculated on downloaded file after verifying signature.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.hash | 2 ++
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/gnutls/gnutls.hash

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
new file mode 100644
index 0000000..c68a792
--- /dev/null
+++ b/package/gnutls/gnutls.hash
@@ -0,0 +1,2 @@
+# Hand caculated after checking pgp signature
+sha256	4762afab5e1b9e829c5f53d2b00cd5e41d43fa6d035efcf239e3fe0459134d45	gnutls-3.2.18.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 5c1559d..0e1076b 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.2
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).16
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).18
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
1.8.5.5
