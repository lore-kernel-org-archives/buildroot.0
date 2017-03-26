From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 12:32:04 +0200
Subject: [Buildroot] [git commit] htop: use correct ncurses config script
	name
Message-ID: <20170326103215.970A4825C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cd1554ee162f6344dab078233f4f6c0d93e7c24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ncurses config script can have different names depending on the
configuration (e.g. wchar support enabled/disabled). So, use
$(NCURSES_CONFIG_SCRIPTS) from the ncurses package as it contains the
proper name.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/htop/htop.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 9451d15..dd3bed4 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -8,7 +8,7 @@ HTOP_VERSION = 2.0.2
 HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
 # Prevent htop build system from searching the host paths
-HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/ncurses5-config
+HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 HTOP_LICENSE = GPLv2
 HTOP_LICENSE_FILES = COPYING
 
