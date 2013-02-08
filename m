From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Feb 2013 08:36:04 -0300
Subject: [Buildroot] [PATCH 4/5] configs/at91sam9g20dfc_defconfig: lock down
	kernel headers vesion
In-Reply-To: <1360323365-5936-1-git-send-email-gustavo@zacarias.com.ar>
References: <1360323365-5936-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1360323365-5936-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/at91sam9g20dfc_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 723b9e1..60764e6 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -2,6 +2,10 @@
 BR2_arm=y
 BR2_arm926t=y
 
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.1.6"
+
 # Host utilities
 #
 BR2_PACKAGE_HOST_SAM_BA=y
-- 
1.7.12.4
