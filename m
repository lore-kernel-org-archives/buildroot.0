From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 22:04:18 +0100
Subject: [Buildroot] [git commit] axel: Fix OpenSSL dependency
Message-ID: <20171206211714.68D1380FA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13b06a4e5287aa280b6bb3deb7f70b86add30216
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl is a virtual package, that can be provided by either libressl
or libopenssl, so there's no need to check for libressl separately.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/axel/axel.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index dcc8afd..136c2e2 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -17,10 +17,7 @@ AXEL_CONF_OPTS = \
 	ac_cv_prog_cc_c99=-std=c99 \
 	CFLAGS="$(TARGET_CFLAGS)"
 
-ifeq ($(BR2_PACKAGE_LIBRESSL),y)
-AXEL_CONF_OPTS += --with-ssl
-AXEL_DEPENDENCIES += libressl
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 AXEL_CONF_OPTS += --with-ssl
 AXEL_DEPENDENCIES += openssl
 else
