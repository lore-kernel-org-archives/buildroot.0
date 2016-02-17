From: Matthew Shyu <matthew.shyu.amlogic@gmail.com>
Date: Wed, 17 Feb 2016 18:41:26 +0800
Subject: [Buildroot] [PATCH 1/1] fix host-openssl binary installation
Message-ID: <1455705686-20822-1-git-send-email-matthew.shyu.amlogic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matthew Shyu <matthew.shyu@amlogic.com>

The Configure script in openssl takes install_prefix from env by default
$install_prefix= "$ENV{'INSTALL_PREFIX'}"
However, the INSTALL_PREFIX points to *TARGET* folder instead of
*HOST* folder.
This is fixed by intentionally setting install_prefix to blank.

Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>
---
 package/openssl/openssl.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index b7498a7..c35e93f 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -63,6 +63,7 @@ define HOST_OPENSSL_CONFIGURE_CMDS
 		$(HOST_CONFIGURE_OPTS) \
 		./config \
 		--prefix=$(HOST_DIR)/usr \
+		--install_prefix= \
 		--openssldir=$(HOST_DIR)/etc/ssl \
 		--libdir=/lib \
 		shared \
-- 
1.7.9.5
