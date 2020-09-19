From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:48:41 +0200
Subject: [Buildroot] [git commit] package/makedumpfile: add optional
 dependency on snappy
Message-ID: <20200919123954.3BD7B80467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b05b0c82ba835282f5b27eb6427faa5fc6514fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/makedumpfile/makedumpfile.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 52a054e734..ad63e280e8 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -25,6 +25,11 @@ MAKEDUMPFILE_DEPENDENCIES += lzo
 MAKEDUMPFILE_MAKE_OPTS += USELZO=on
 endif
 
+ifeq ($(BR2_PACKAGE_SNAPPY),y)
+MAKEDUMPFILE_DEPENDENCIES += snappy
+MAKEDUMPFILE_MAKE_OPTS += USESNAPPY=on
+endif
+
 define MAKEDUMPFILE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		$(MAKEDUMPFILE_MAKE_OPTS)
