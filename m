From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 16:03:16 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: enabled dnssec when
 available
Message-ID: <20200308220316.40922-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When dnssec is available set default-dnssec to the backwards compatible
allow-downgrade option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 22165de2c1..547a4d44ec 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -26,7 +26,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dman=false \
 	-Dima=false \
 	-Dldconfig=false \
-	-Ddefault-dnssec=no \
 	-Ddefault-hierarchy=hybrid \
 	-Dtests=false \
 	-Dsplit-bin=true \
@@ -155,9 +154,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
-SYSTEMD_CONF_OPTS += -Dgcrypt=true
+SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade -Dgcrypt=true
 else
-SYSTEMD_CONF_OPTS += -Dgcrypt=false
+SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no -Dgcrypt=false
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
-- 
2.20.1
