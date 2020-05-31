From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:10:24 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/freerdp: security
 bump to version 2.1.1
Message-ID: <20200531211056.D374C85F07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3de6a9546ed1102ed9efeac0d190aa939bc256a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

From ChangeLog:
- CVE: GHSL-2020-100 OOB Read in ntlm_read_ChallengeMessage
- CVE: GHSL-2020-101 OOB Read in security_fips_decrypt due to
  uninitialized value
- CVE: GHSL-2020-102 OOB Write in crypto_rsa_common
- Enforce synchronous legacy RDP encryption count (#6156)
- Fixed some leaks and crashes missed in 2.1.0
- Removed dynamic channel listener limits
- Lots of resource cleanup fixes (clang sanitizers)

https://github.com/FreeRDP/FreeRDP/blob/2.1.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cb6eb5db792016751ab01b5dda04536ec65169c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index b94ca10533..a6100271fd 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.0.1.tar.gz.sha256
-sha256  2c4841c6a52fb153346436447708cbae7b479a7d8112d093e95d8c98f084be1b  freerdp-2.1.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.1.1.tar.gz.sha256
+sha256  6c6bf72fba1058ca6524c040d0825e4cdaa88682884a6c1c360e1cd5b8e21723  freerdp-2.1.1.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index d3038bd5c2..f3bc26ac52 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.1.0
+FREERDP_VERSION = 2.1.1
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
