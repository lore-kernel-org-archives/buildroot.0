From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:04:38 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/libopenssl: use
 HTTPS for URL
Message-ID: <20181216210033.D81838DF8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07480538db310b049ac417075791c718b6744db1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

The host forces HTTPS regardless. This can be seen in the build logs:

 >>> host-libopenssl 1.0.2q Downloading
 URL transformed to HTTPS due to an HSTS policy
 --2018-12-10 09:53:27--  https://www.openssl.org/source/openssl-1.0.2q.tar.gz

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4d6fa0376064dcd3bc2901402307d6730e7b4b8b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index ca0521b229..dc15abf66a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBOPENSSL_VERSION = 1.0.2q
-LIBOPENSSL_SITE = http://www.openssl.org/source
+LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
 LIBOPENSSL_LICENSE_FILES = LICENSE
