From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 10:22:15 +0100
Subject: [Buildroot] [git commit] wolfssl: install into staging
Message-ID: <20181031092013.39B137F956@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff1d005f8026b05c1f7e016f8342b18845641a81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wolfssl is a library, so it should be installed into staging so other
packages can find the header files / library.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolfssl/wolfssl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index ec83d7d1dd..c246b08513 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -7,6 +7,7 @@
 WOLFSSL_VERSION = 3.14.0
 WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/archive
 WOLFSSL_SOURCE = v$(WOLFSSL_VERSION)-stable.tar.gz
+WOLFSSL_INSTALL_STAGING = YES
 
 WOLFSSL_LICENSE = GPL-2.0
 WOLFSSL_LICENSE_FILES = COPYING LICENSING
