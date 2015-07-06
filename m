From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 6 Jul 2015 10:02:05 +0200
Subject: [Buildroot] [PATCH 4/4] squid: add gnutls support
In-Reply-To: <1436169725-26108-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1436169725-26108-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1436169725-26108-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A new --without-gnutls option has been added to configure, so let's use
it in order to enable or disable gnutls support in squid.

Related:

  http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.6-RELEASENOTES.html#ss4.1

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/squid/squid.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 469fb1b..80235a4 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -62,6 +62,13 @@ SQUID_CONF_OPTS += --with-openssl
 SQUID_DEPENDENCIES += openssl
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+SQUID_CONF_OPTS += --with-gnutls
+SQUID_DEPENDENCIES += gnutls
+else
+SQUID_CONF_OPTS += --without-gnutls
+endif
+
 define SQUID_CLEANUP_TARGET
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, \
 		RunCache RunAccel)
-- 
2.3.6
