From: jared.bents at rockwellcollins.com <jared.bents@rockwellcollins.com>
Date: Thu, 17 Jan 2019 09:05:42 -0600
Subject: [Buildroot] [PATCH v1 1/1] package/openresolv: update to fix
 install location
Message-ID: <20190117150542.13062-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jared Bents <jared.bents@rockwellcollins.com>

Update to install in /sbin as expected by other applications
such as strongswan instead of /usr/sbin

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/openresolv/openresolv.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/openresolv/openresolv.mk b/package/openresolv/openresolv.mk
index 6adf973527..3f9d603d40 100644
--- a/package/openresolv/openresolv.mk
+++ b/package/openresolv/openresolv.mk
@@ -10,8 +10,7 @@ OPENRESOLV_LICENSE = BSD-2-Clause
 OPENRESOLV_LICENSE_FILES = LICENSE
 
 define OPENRESOLV_CONFIGURE_CMDS
-	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure --prefix=/usr \
-		--sysconfdir=/etc
+	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure --sysconfdir=/etc
 endef
 
 define OPENRESOLV_BUILD_CMDS
-- 
2.18.0
