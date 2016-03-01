From: Joel Stanley <joel@jms.id.au>
Date: Tue,  1 Mar 2016 14:47:32 +1030
Subject: [Buildroot] [PATCH v2] linux-firmware: Update bnx2x firwmare version
In-Reply-To: <874mcs9qkc.fsf@linux.vnet.ibm.com>
References: <874mcs9qkc.fsf@linux.vnet.ibm.com>
Message-ID: <1456805852-11045-1-git-send-email-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux kernel 4.2 moved the driver to a newer firmware version. As that
is our default kernel, move the firmeware to a compatable version.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Just use the new firmware to avoid adding extra cruft to our config system

 package/linux-firmware/linux-firmware.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 083a381ea00a..9363099b68fd 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -253,9 +253,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += \
-	bnx2x/bnx2x-e1-7.10.51.0.fw \
-	bnx2x/bnx2x-e1h-7.10.51.0.fw \
-	bnx2x/bnx2x-e2-7.10.51.0.fw
+	bnx2x/bnx2x-e1-7.12.30.0.fw \
+	bnx2x/bnx2x-e1h-7.12.30.0.fw \
+	bnx2x/bnx2x-e2-7.12.30.0.fw
 # No license file; the license is in the file WHENCE
 # which is installed unconditionally
 endif
-- 
2.7.0
