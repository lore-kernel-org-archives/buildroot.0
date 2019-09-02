From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:16:36 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libssh2: security
 bump to version 1.9.0
Message-ID: <20190902151402.DB2788A2F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3563e75a6cbae3fed9b29b5293984dcb0c36898e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fix CVE-2019-13115: In libssh2 before 1.9.0,
kex_method_diffie_hellman_group_exchange_sha256_key_exchange in kex.c
has an integer overflow that could lead to an out-of-bounds read in the
way packets are read from the server. A remote attacker who compromises
a SSH server may be able to disclose sensitive information or cause a
denial of service condition on the client system when a user connects to
the server. This is related to an _libssh2_check_length mistake, and is
different from the various issues fixed in 1.8.1, such as CVE-2019-3855.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dea6f1f3038a8637add0e0ec576d1bafe7914e45)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh2/libssh2.hash | 2 +-
 package/libssh2/libssh2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index c4732a2c07..58aba4ad71 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 468e7a81a8121c06cb099eef2e17106b0b8c2e1d890b1c0e34e1951f182babb1  libssh2-1b3cbaff518f32e5b70650d4b7b52361b1410d37.tar.gz
+sha256 db257d41754b16518c3bd0c3b8dd08940ccbee5fc44cef7bfb052d930bcbbda3  libssh2-1.9.0.tar.gz
 sha256 e15ed284a15e80115467d6d7f030f0d89d8fabbecd78fb6e0f861f0cfc128fd9  COPYING
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index abee1f8c77..824e208033 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 1b3cbaff518f32e5b70650d4b7b52361b1410d37
-LIBSSH2_SITE = $(call github,libssh2,libssh2,$(LIBSSH2_VERSION))
+LIBSSH2_VERSION = 1.9.0
+LIBSSH2_SITE = $(call github,libssh2,libssh2,libssh2-$(LIBSSH2_VERSION))
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_INSTALL_STAGING = YES
