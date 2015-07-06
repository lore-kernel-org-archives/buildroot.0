From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 6 Jul 2015 17:53:35 +0200
Subject: [Buildroot] [PATCH] squid: explicitly disable openssl support when
	BR2_PACKAGE_OPENSSL != y
Message-ID: <1436198015-7934-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/squid/squid.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 80235a4..e201673 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -60,6 +60,8 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SQUID_CONF_OPTS += --with-openssl
 SQUID_DEPENDENCIES += openssl
+else
+SQUID_CONF_OPTS += --without-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-- 
2.3.6
