From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] radvd: remove --program-prefix
Message-ID: <20110912052636.6918B8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc1b29e9bca1218dc1bda67880dfc442e803bca1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/radvd/radvd.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index fe8be5d..6b7468a 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -7,7 +7,6 @@ RADVD_VERSION:=1.6
 RADVD_SOURCE:=radvd-$(RADVD_VERSION).tar.gz
 RADVD_SITE:=http://www.litech.org/radvd/dist/
 RADVD_DEPENDENCIES:=flex host-flex
-RADVD_CONF_OPT:= --program-prefix=''
 
 define RADVD_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
-- 
1.7.3.4
