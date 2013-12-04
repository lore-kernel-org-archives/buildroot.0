From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 09:04:23 +0100
Subject: [Buildroot] [git commit] gnutls: revert bump
Message-ID: <20131204093549.701B79BF08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2648ecfc106f1d296837f8ba49410ab0c877b16f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Revert bump to 3.2.7 from commit 8238e744b813e9922c0a81f21b271263ef0e216a
It causes build issues because of an internal gnulib bump:
http://autobuild.buildroot.net/results/48d/48d5c6364fec55e84309b2fb6986f206699f1800/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 8a7f3f7..8ab0665 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUTLS_VERSION = 3.2.7
+GNUTLS_VERSION = 3.2.6
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.2
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
