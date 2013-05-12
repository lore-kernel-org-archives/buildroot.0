From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 21:10:25 +0200
Subject: [Buildroot] [git commit] openssl: fix host-openssl dependencies
Message-ID: <20130512191127.D40C69A128@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a77344162f952ae8c5a49f309a1f09a1761f2dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for ocf-linux or cryptodev-linux added a dependency of host-openssl
on host-ocf-linux / host-cryptodev-linux, which we don't have and the
dependency is anyway not needed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 2e04789..081fc90 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -10,6 +10,7 @@ OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
+HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
 
