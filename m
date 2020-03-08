From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 16:27:11 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: enable nss-mymachines when
 machined is enabled
Message-ID: <20200308222711.75586-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 22165de2c1..407ae81aad 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -268,9 +268,9 @@ SYSTEMD_CONF_OPTS += -Dlogind=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
-SYSTEMD_CONF_OPTS += -Dmachined=true
+SYSTEMD_CONF_OPTS += -Dmachined=true -Dnss-mymachines=true
 else
-SYSTEMD_CONF_OPTS += -Dmachined=false
+SYSTEMD_CONF_OPTS += -Dmachined=false -Dnss-mymachines=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_IMPORTD),y)
-- 
2.20.1
