From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 18:34:02 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/mcelog: add
 SELinux refpolicy module
Message-ID: <20210319171640.547158840D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=245362836d00ee73104a3eef5dc7e5605b4713ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

SELinux support for mcelog is added by the admin/mcelog refpolicy
module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5337785981de8d2377ad124f202384983275a5c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
