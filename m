From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:47:09 +0200
Subject: [Buildroot] [git commit] package/systemd: enable nss-mymachines
 when machined is enabled
Message-ID: <20200412133307.978128E773@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=427dbae155d58dcb18bfab1461326216d3a42abc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5f6c8a60bb..7ba4c540d8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -266,9 +266,9 @@ SYSTEMD_CONF_OPTS += -Dlogind=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
-SYSTEMD_CONF_OPTS += -Dmachined=true
+SYSTEMD_CONF_OPTS += -Dmachined=true -Dnss-mymachines=true
 else
-SYSTEMD_CONF_OPTS += -Dmachined=false
+SYSTEMD_CONF_OPTS += -Dmachined=false -Dnss-mymachines=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_IMPORTD),y)
