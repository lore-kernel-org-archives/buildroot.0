From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 23:10:32 +0100
Subject: [Buildroot] [git commit] package/bridge-utils: add SELinux
 refpolicy module
Message-ID: <20210316214740.541A5881F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2683207a2fbcaa2ceff4252889136b41cc81317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bridge-utils's brctl tool is supported by the admin/brctl SELinux
refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
