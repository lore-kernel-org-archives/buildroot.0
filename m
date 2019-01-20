From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Jan 2019 22:51:02 +0100
Subject: [Buildroot] [git commit] package/openresolv: update to fix install
 location
Message-ID: <20190120215252.6367E8A6C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a0cf00e6be024488456b31622d139d40d57460c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to install in /sbin as expected by other applications
such as strongswan instead of /usr/sbin

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
