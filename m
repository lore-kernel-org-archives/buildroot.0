From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] portmap: install initscript
Message-ID: <20101222232247.889258E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4a54b10ba9b499b361deb7b2337e5d648310ced4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to patrick.ziegler at fh-kl.de in the mailing list for noticing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/portmap/portmap.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index dba6155..e83ff1d 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -23,6 +23,8 @@ define PORTMAP_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/man/man8/pmap_dump.8
 	$(INSTALL) -D $(@D)/pmap_set.8 \
 		$(TARGET_DIR)/usr/share/man/man8/pmap_set.8
+	$(INSTALL) -m 0755 package/portmap/S13portmap \
+		$(TARGET_DIR)/etc/init.d
 endef
 
 define PORTMAP_UNINSTALL_TARGET_CMDS
-- 
1.7.2.2
