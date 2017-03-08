From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Mar 2017 18:05:01 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] gnutls: security bump to
	version 3.5.10
Message-ID: <20170308170715.9294282161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d51608ac63db3730df24ff1916cf58bc7239df03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixes:
GNUTLS-SA-2017-3A - Addressed integer overflow resulting to invalid
memory write in OpenPGP certificate parsing.
GNUTLS-SA-2017-3B - Addressed crashes in OpenPGP certificate parsing,
related to private key parser. No longer allow OpenPGP certificates
(public keys) to contain private key sub-packets.
GNUTLS-SA-2017-3C - Addressed large allocation in OpenPGP certificate
parsing, that could lead in out-of-memory condition.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6fdb2b109bdec24ea426e0a6786ced7dbb591732)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 156d2aa..64b86d7 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	82b10f0c4ef18f4e64ad8cef5dbaf14be732f5095a41cf366b4ecb4050382951	gnutls-3.5.9.tar.xz
+sha256	af443e86ba538d4d3e37c4732c00101a492fe4b56a55f4112ff0ab39dbe6579d	gnutls-3.5.10.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 932c0fa..be1cf00 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.5
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).9
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPLv2.1+ (core library), GPLv3+ (gnutls-openssl library)
