From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 13:21:50 +0100
Subject: [Buildroot] [git commit branch/next] hostapd: keep previous patches
 when DRIVER_RTW set
Message-ID: <20171125121432.251548102B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e252c9575fbdc82ac2800fbe99edfe7621596a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changed HOSTAPD_PATCH= to HOSTAPD_PATCH+= to keep previously added
patches.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hostapd/hostapd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index bb3919e..0ed1631 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -48,7 +48,7 @@ HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
-HOSTAPD_PATCH = https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
+HOSTAPD_PATCH += https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
 HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW
 endif
 
