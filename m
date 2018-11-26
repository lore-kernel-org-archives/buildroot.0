From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:07:41 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] prosody: security bump to
 version 0.9.14
Message-ID: <20181126170515.A59AF88804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=311f62435b1b3ae65578e680125858d42d2d41ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This fixes a cross-host authentication vulnerability, CVE-2018-10847.
The issue affects Prosody instances that have multiple virtual hosts
(including anonymous authenticated hosts):
https://blog.prosody.im/prosody-0-10-2-security-release

A full security advisory is available at
https://prosody.im/security/advisory_20180531

Compute hashes locally as they are no more available on
https://prosody.im/downloads/source/{MD5,SHA1,SHA256,SHA512}SUMS

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/prosody.hash | 7 ++-----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 38942ea7ff..8debfe19eb 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,5 +1,2 @@
-# Hashes from: https://prosody.im/downloads/source/{MD5,SHA1,SHA256,SHA512}SUMS
-md5    d743adea6cfbaacc3a24cc0c3928bb1b  prosody-0.9.12.tar.gz
-sha1   1ee224263a5b3d67960e12edbbe6b2f16b95d147  prosody-0.9.12.tar.gz
-sha256 1a59a322b71928a21985522aa00d0eab3552208d7bf9ecb318542a1b2fee3e8d  prosody-0.9.12.tar.gz
-sha512 e87b5f3b3e327722cec9d8d0470684e2ec2788a1c5ae623c4f505a00572ef21f65afe84cd5b7de47d6a65fe8872506fe34e5e8886e20979ff84710669857ca76  prosody-0.9.12.tar.gz
+# Locally calculated
+sha256 27d1388acd79eaa453f2b194bd23c25121fe0a704d0dd940457caf1874ea1123  prosody-0.9.14.tar.gz
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index d19653503d..ab50cc88dc 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.9.12
+PROSODY_VERSION = 0.9.14
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
