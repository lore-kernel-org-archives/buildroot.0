From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 24 Nov 2019 13:48:23 -0800
Subject: [Buildroot] [PATCH/next v2 4/4] package/polkit: enable systemd
 login support
In-Reply-To: <20191124214823.2570598-1-aduskett@gmail.com>
References: <20191124214823.2570598-1-aduskett@gmail.com>
Message-ID: <20191124214823.2570598-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If systemd-logind is selected, enable libsystemd-login support.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/polkit/polkit.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 4135a64d6b..5e04c0908c 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -26,4 +26,10 @@ else
 POLKIT_CONF_OPTS += --with-authfw=shadow
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
+POLKIT_DEPENDENCIES += systemd
+POLKIT_CONF_OPTS += \
+	--enable-libsystemd-login=yes
+endif
+
 $(eval $(autotools-package))
-- 
2.23.0
