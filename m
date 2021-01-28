From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 28 Jan 2021 10:27:57 +0100
Subject: [Buildroot] [PATCH 9/9] package/mcelog: add SELinux refpolicy module
In-Reply-To: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
References: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
Message-ID: <20210128092757.1016598-10-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SELinux support for mcelog is added by the admin/mcelog refpolicy
module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
-- 
2.25.4
