From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 18:20:03 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/bridge-utils: add
 SELinux refpolicy module
Message-ID: <20210319171640.04F0F8840F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03a6866bbb56f2ab286a015775a112f30ce814e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Bridge-utils's brctl tool is supported by the admin/brctl SELinux
refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e2683207a2fbcaa2ceff4252889136b41cc81317)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
