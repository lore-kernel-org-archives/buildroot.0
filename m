From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:33:37 +0100
Subject: [Buildroot] [git commit] package/lftp: Add optional support for
 libidn
Message-ID: <20171129202804.4D6958222C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86ad37b948b5dd1845ef7e0a3620a0e9c5820559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mario Lang <mlang@blind.guru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lftp/lftp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index de4ebb8..b174057 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -41,6 +41,13 @@ else
 LFTP_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+LFTP_DEPENDENCIES += libidn
+LFTP_CONF_OPTS += --with-libidn=$(STAGING_DIR)/usr
+else
+LFTP_CONF_OPTS += --without-libidn
+endif
+
 # Remove /usr/share/lftp
 define LFTP_REMOVE_DATA
 	$(RM) -fr $(TARGET_DIR)/usr/share/lftp
