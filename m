From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 21:26:55 +0100
Subject: [Buildroot] [git commit] polarssl: security bump to version 1.2.19
Message-ID: <20160208202658.B6B7A80567@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e1eec49a520081835e305f071c96eca0d4fd33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix bug in certificate validation that caused valid chains to be
rejected when the first intermediate certificate has
pathLenConstraint=0.

Removed potential leak in rsa_rsassa_pkcs1_v15_sign().

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/polarssl/polarssl.hash | 4 ++--
 package/polarssl/polarssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/polarssl/polarssl.hash b/package/polarssl/polarssl.hash
index 71f7c29..3f1871c 100644
--- a/package/polarssl/polarssl.hash
+++ b/package/polarssl/polarssl.hash
@@ -1,2 +1,2 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.2.0-2.1.3-1.3.15-and-polarssl.1.2.18-released
-sha256	63c4ed4d9f6a241088e2287958f265403f874248d6a98b98f27cd3aa2f90f030	polarssl-1.2.18-gpl.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.2.1-2.1.4-1.3.16-and-polarssl.1.2.19-released
+sha256	24cb1608a160101ead3c7240f35fc447fe7880cd60f7ed6c9db7a1d773ccd4b8	polarssl-1.2.19-gpl.tgz
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index d988bf1..9199f28 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 POLARSSL_SITE = https://tls.mbed.org/code/releases
-POLARSSL_VERSION = 1.2.18
+POLARSSL_VERSION = 1.2.19
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
