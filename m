From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Nov 2018 13:14:03 +0100
Subject: [Buildroot] [PATCH 1/1] prosody: security bump to version 0.10.2
Message-ID: <20181118121403.25528-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes a cross-host authentication vulnerability, CVE-2018-10847.
The issue affects Prosody instances that have multiple virtual hosts
(including anonymous authenticated hosts):
https://blog.prosody.im/prosody-0-10-2-security-release

A full security advisory is available at
https://prosody.im/security/advisory_20180531

Compute hashes locally as they are no more available on
https://prosody.im/downloads/source/{MD5,SHA1,SHA256,SHA512}SUMS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/prosody/prosody.hash | 10 +++++-----
 package/prosody/prosody.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 898d21814f..b38414294c 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
-# Hashes from: https://prosody.im/downloads/source/{MD5,SHA1,SHA256,SHA512}SUMS
-md5    0eebf7a18ce1fc7dd9954c94ebd85f54  prosody-0.10.0.tar.gz
-sha1   57c1c5a665e6453bdde06727ef398cd69accd9d7  prosody-0.10.0.tar.gz
-sha256 7414e447256c60b2645578c4a5913113cd74b419ca5a032b54db90d98a978498  prosody-0.10.0.tar.gz
-sha512 ee66e240afba6a8cb286623da48d9b535798153fb65e32070cec93aafe360e91f7087eeb49dec0f7d145e24f04339ed0878e50835b52f682130b204e22990ce9  prosody-0.10.0.tar.gz
+# Locally computed:
+md5    4cb1ac0db2b739b933ded5038551d7c2  prosody-0.10.2.tar.gz
+sha1   1d51e542475c3f3e712eace29537b042c941d6ab  prosody-0.10.2.tar.gz
+sha256 75b5f035e7a74d5f208eeeaf8419b94a85d09b40252d444cff8033fde3c9768e  prosody-0.10.2.tar.gz
+sha512 9fc05e34b45b0c16835ba94a73532fb3b4ee335f27d56bb9260e1b3e22614f89f44eb5d04b4e90d016db0b5bee6f5c7e7d099e1defb027e6823ee7667c1fe28f  prosody-0.10.2.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 5282a9af0f..8c09645210 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.10.0
+PROSODY_VERSION = 0.10.2
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-- 
2.17.1
