From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 21:35:43 +0200
Subject: [Buildroot] [git commit] wireshark: don't overwrite
	WIRESHARK_CONF_ENV
Message-ID: <20161020193546.3F59781794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b29b7f4187aae7d6c60d7e35b301dd9f214f265f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index f7cc8f8..593b196 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -78,7 +78,7 @@ WIRESHARK_CONF_OPTS += --with-gnutls=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+WIRESHARK_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 WIRESHARK_CONF_OPTS += --with-gcrypt=yes
 WIRESHARK_DEPENDENCIES += libgcrypt
 else
