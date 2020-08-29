From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:58:02 +0200
Subject: [Buildroot] [git commit] package/i2pd: bump to version 2.33.0
Message-ID: <20200902161639.0FDFD85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8535d1b1964be54b4bb55bef7c09371527fb7b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From https://github.com/PurpleI2P/i2pd/releases/tag/2.33.0:
 - UDP tunnels through ECIES-X25519-AEAD-Ratchet
 - Shared transient addresses
 - ECIES-X25519-AEAD-Ratchet and multiple encryption keys through I2CP
 - Pre-calculated x25519 ephemeral keys
 - crypto.ratchet.inboundTags parameter
 - Don't save invalid address to AddressBook
 - Correct ECDSA signatures names in SAM
 - New webconsole layout
 - Shared routing path for datagram session
 - Change datagram routing path if nothing comes back in 10 seconds
 - Updated reseed servers list
 - Don't connect through terminated SAM destination

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/i2pd/i2pd.hash | 3 ++-
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index d56c9c1b47..1a19ccf687 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,3 +1,4 @@
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.33.0/SHA512SUMS
+sha512  7a3e7a8a908be8a12b675fda4ce923cb2b0eaf3e9b12a513b9ae7b56e9ecb593eef0ea278debb4027406d50ee9a46599a6792a54ce2e2f4e2c44c1fc82479910  i2pd-2.33.0.tar.gz
 # Locally computed:
-sha256  64229101411a9dda3237dc27939aa13ec90d4900aae499e59931063c36e8556b  i2pd-2.32.1.tar.gz
 sha256  d147a6acdaf8ec9f6513802ef6cad4a4afcdb5ab6b98d9f6bb26d2b7f4cf454c  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 736794866d..461f483d1f 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.32.1
+I2PD_VERSION = 2.33.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
