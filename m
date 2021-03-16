From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 23:11:22 +0100
Subject: [Buildroot] [git commit] package/mcelog: add SELinux refpolicy
 module
Message-ID: <20210316214740.B99FA87B82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5337785981de8d2377ad124f202384983275a5c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SELinux support for mcelog is added by the admin/mcelog refpolicy
module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mcelog/mcelog.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index c24366546c..9245825430 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -8,6 +8,7 @@ MCELOG_VERSION = 172
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
+MCELOG_SELINUX_MODULES = mcelog
 
 define MCELOG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
