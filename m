From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 May 2011 20:03:35 +0200
Subject: [Buildroot] [git commit] bind: give path to OpenSSL when OpenSSL is
	enabled
Message-ID: <20110519205107.948EA83544@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a02cfbf1f4a82ee6582e2bf7622b2bf105359ea9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bind needs to be specifically told where OpenSSL is, otherwise, the
build fails with:

checking for OpenSSL library... configure: error: OpenSSL was not found in any of /usr /usr/local /usr/local/ssl /usr/pkg /usr/sfw; use --with-openssl=/path
If you don't want OpenSSL, use --without-openssl

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bind/bind.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e3341bd..2df6ae8 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -27,6 +27,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	BIND_DEPENDENCIES += openssl
+	BIND_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr
 else
 	BIND_CONF_OPT += --with-openssl=no
 endif
-- 
1.7.3.4
