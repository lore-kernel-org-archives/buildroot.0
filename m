From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 28 Jan 2021 10:27:50 +0100
Subject: [Buildroot] [PATCH 2/9] package/bridge-utils: add SELinux refpolicy
 module
In-Reply-To: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
References: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
Message-ID: <20210128092757.1016598-3-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bridge-utils's brctl tool is supported by the admin/brctl SELinux
refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/bridge-utils/bridge-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index fa71c3a64e..2de5517fc5 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -11,6 +11,7 @@ BRIDGE_UTILS_AUTORECONF = YES
 BRIDGE_UTILS_LICENSE = GPL-2.0+
 BRIDGE_UTILS_LICENSE_FILES = COPYING
 BRIDGE_UTILS_CPE_ID_VENDOR = kernel
+BRIDGE_UTILS_SELINUX_MODULES = brctl
 
 # Avoid using the host's headers. Location is not important as
 # required headers will anyway be found from within the sysroot.
-- 
2.25.4
