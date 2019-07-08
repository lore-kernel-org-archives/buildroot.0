From: jared.bents at rockwellcollins.com <jared.bents@rockwellcollins.com>
Date: Mon,  8 Jul 2019 15:07:54 -0500
Subject: [Buildroot] [PATCH v3 1/1] package/hostapd: add debug information
 options
Message-ID: <20190708200754.20272-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jared Bents <jared.bents@rockwellcollins.com>

hostapd 2.7 added compile time options to include
redirecting the output from stdout to a file or syslog
like wpa_supplicant

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
v1->v2: Updated to move reposition the debug syslog option
v2->v3: Updated to turn both options on unconditionally
---
 package/hostapd/hostapd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 550f887206..e6542c879c 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -31,7 +31,10 @@ HOSTAPD_LICENSE = BSD-3-Clause
 HOSTAPD_LICENSE_FILES = README
 HOSTAPD_CONFIG_SET =
 
-HOSTAPD_CONFIG_ENABLE = CONFIG_INTERNAL_LIBTOMMATH
+HOSTAPD_CONFIG_ENABLE = \
+	CONFIG_INTERNAL_LIBTOMMATH \
+	CONFIG_DEBUG_FILE \
+	CONFIG_DEBUG_SYSLOG
 
 HOSTAPD_CONFIG_DISABLE =
 
-- 
2.18.0
