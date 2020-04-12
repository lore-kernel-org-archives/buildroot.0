From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:47:09 +0200
Subject: [Buildroot] [git commit] package/systemd: enabled dnssec when
 available
Message-ID: <20200412133307.84C0A8E773@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2ba6105a7c5f2319fe4006ead54e3515e27bb4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libgcrypt is available set default-dnssec to the backwards
compatible allow-downgrade option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 623e942205..009f599c10 100644
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
@@ -154,9 +153,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
-SYSTEMD_CONF_OPTS += -Dgcrypt=true
+SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade -Dgcrypt=true
 else
-SYSTEMD_CONF_OPTS += -Dgcrypt=false
+SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no -Dgcrypt=false
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
