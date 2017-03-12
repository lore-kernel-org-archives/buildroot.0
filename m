From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Mar 2017 12:33:28 +0100
Subject: [Buildroot] [PATCH 5/5] package/gnupg2: add optional support for
	gnutls
In-Reply-To: <20170312113328.5745-1-bernd.kuhls@t-online.de>
References: <20170312113328.5745-1-bernd.kuhls@t-online.de>
Message-ID: <20170312113328.5745-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnupg2/gnupg2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index d7f277cdf..5815e7003 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -35,6 +35,13 @@ else
 GNUPG2_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+GNUPG2_CONF_OPTS += --enable-gnutls
+GNUPG2_DEPENDENCIES += gnutls
+else
+GNUPG2_CONF_OPTS += --disable-gnutls
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 GNUPG2_CONF_OPTS += --enable-ccid-driver
 GNUPG2_DEPENDENCIES += libusb-compat
-- 
2.11.0
