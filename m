From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 22:02:09 +0200
Subject: [Buildroot] [git commit] gnutls: bump to version 3.2.18
Message-ID: <20140918200238.0A5799D6DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e849bd9b68b95945a252e3404315342e9cce123
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash, calculated on downloaded file after verifying signature.

[Peter: tweak hash comment]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash |    2 ++
 package/gnutls/gnutls.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
new file mode 100644
index 0000000..22246c3
--- /dev/null
+++ b/package/gnutls/gnutls.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
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
