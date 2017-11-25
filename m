From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Sat, 25 Nov 2017 14:08:51 +0300
Subject: [Buildroot] [PATCH] hostapd: keep previous patches when DRIVER_RTW
 set
In-Reply-To: <20171125114643.5b290738@windsurf.lan>
References: <20171125114643.5b290738@windsurf.lan>
Message-ID: <20171125110851.1395-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed HOSTAPD_PATCH= to HOSTAPD_PATCH+= to keep previously added
patches.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/hostapd/hostapd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index bb3919e988..0ed1631421 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -48,7 +48,7 @@ HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
-HOSTAPD_PATCH = https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
+HOSTAPD_PATCH += https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
 HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW
 endif
 
-- 
2.11.0
