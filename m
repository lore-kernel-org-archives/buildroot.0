From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  7 May 2020 18:59:56 -0700
Subject: [Buildroot] [PATCH 5/5] package/systemd: add support for apparmor
In-Reply-To: <20200508015956.3270405-1-aduskett@gmail.com>
References: <20200508015956.3270405-1-aduskett@gmail.com>
Message-ID: <20200508015956.3270405-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If libapparmor is selected, depend on libapparmor and set -Dapparmor=true

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9f5429fd19..50398e747e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -49,6 +49,13 @@ else
 SYSTEMD_CONF_OPTS += -Dacl=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+SYSTEMD_DEPENDENCIES += libapparmor
+SYSTEMD_CONF_OPTS += -Dapparmor=true
+else
+SYSTEMD_CONF_OPTS += -Dapparmor=false
+endif
+
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 SYSTEMD_DEPENDENCIES += audit
 SYSTEMD_CONF_OPTS += -Daudit=true
-- 
2.26.2
