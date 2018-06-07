From: Mikhail Karpenko <karpenko@fastmail.com>
Date: Thu,  7 Jun 2018 22:51:32 +0300
Subject: [Buildroot] [PATCH 1/1] numactl: change source code provider to
 GitHub
Message-ID: <20180607195132.7501-1-karpenko@fastmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original ftp with source code is not reachable any more and this
commit changes the location of the package to corresponding GitHub
project.

Signed-off-by: Mikhail Karpenko <karpenko@fastmail.com>
---
 package/numactl/numactl.hash | 2 +-
 package/numactl/numactl.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index c36e24d6ba..8a395417f1 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	450c091235f891ee874a8651b179c30f57a1391ca5c4673354740ba65e527861	numactl-2.0.11.tar.gz
+sha256 3e099a59b2c527bcdbddd34e1952ca87462d2cef4c93da9b0bc03f02903f7089        numactl-v2.0.11.tar.gz
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index d37ee9e882..d3ce4f43c0 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.11
-NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
+NUMACTL_VERSION = v2.0.11
+NUMACTL_SITE = $(call github,numactl,numactl,$(NUMACTL_VERSION))
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = README
 NUMACTL_INSTALL_STAGING = YES
+NUMACTL_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.17.0
