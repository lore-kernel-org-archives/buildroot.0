From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun, 26 Mar 2017 03:36:54 -0300
Subject: [Buildroot] [PATCH 2/2] htop: use correct ncurses config script name
In-Reply-To: <20170326063654.10068-1-rprebello@gmail.com>
References: <20170326063654.10068-1-rprebello@gmail.com>
Message-ID: <20170326063654.10068-2-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ncurses config script can have different names depending on the
configuration (e.g. wchar support enabled/disabled). So, use
$(NCURSES_CONFIG_SCRIPTS) from the ncurses package as it contains the
proper name.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/htop/htop.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 9451d159f..dd3bed41b 100644
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
 
-- 
2.11.0
