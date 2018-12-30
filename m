From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:38:11 +0100
Subject: [Buildroot] [git commit] package/apache: enable optional support
 for nghttp2
Message-ID: <20181230154022.1378C81450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a889534cb21118b9ef9031960708f723b17d66d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apache/apache.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 283c3cbd50..a95ac69f31 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -63,6 +63,15 @@ else
 APACHE_CONF_OPTS += --disable-lua
 endif
 
+ifeq ($(BR2_PACKAGE_NGHTTP2),y)
+APACHE_CONF_OPTS += \
+	--enable-http2 \
+	--with-nghttp2=$(STAGING_DIR)/usr
+APACHE_DEPENDENCIES += nghttp2
+else
+APACHE_CONF_OPTS += --disable-http2
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 APACHE_DEPENDENCIES += openssl
 APACHE_CONF_OPTS += \
