From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 00:51:34 +0200
Subject: [Buildroot] [git commit] zic: use <PKG>_STRIP_COMPONENTS
Message-ID: <20150711225139.D597B8081D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10a2b798a45ca13099091760a78408172e1164b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zic/zic.mk |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index a768ac6..03e023a 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -7,14 +7,9 @@
 ZIC_VERSION = 2015e
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = ftp://ftp.iana.org/tz/releases
+ZIC_STRIP_COMPONENTS = 0
 ZIC_LICENSE = Public domain
 
-# Don't strip any path components during extraction.
-define HOST_ZIC_EXTRACT_CMDS
-	gzip -d -c $(DL_DIR)/$(ZIC_SOURCE) \
-		| $(TAR) --strip-components=0 -C $(@D) -xf -
-endef
-
 define HOST_ZIC_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
 endef
