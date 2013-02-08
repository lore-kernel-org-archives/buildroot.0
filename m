From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Feb 2013 08:36:03 -0300
Subject: [Buildroot] [PATCH 3/5] configs/armadeus_apf9328_defconfig: lock
	down kernel headers version
In-Reply-To: <1360323365-5936-1-git-send-email-gustavo@zacarias.com.ar>
References: <1360323365-5936-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1360323365-5936-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/armadeus_apf9328_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index 945d385..1ed1dd5 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -14,6 +14,11 @@ BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
+
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.1.1"
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf9328"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
-- 
1.7.12.4
