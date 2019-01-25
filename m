From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 08:35:41 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] wolfssl: install into
 staging
Message-ID: <20190125073557.EA5D28E6B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cabefddff5d456adfafde813dfedbfaf6ab005be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

wolfssl is a library, so it should be installed into staging so other
packages can find the header files / library.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ff1d005f8026b05c1f7e016f8342b18845641a81)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
