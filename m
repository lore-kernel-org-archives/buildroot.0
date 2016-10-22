From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] zip: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132036.C7C0D8199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e2c37221c12409cfaac82b6a8b3a1c1b375a58b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zip/zip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index d2487b7..66d94b3 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -39,14 +39,14 @@ define ZIP_INSTALL_TARGET_CMDS
 endef
 
 define HOST_ZIP_BUILD_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(HOST_CFLAGS) $(ZIP_CFLAGS)" \
 		AS="$(HOSTCC) -c" \
 		-f unix/Makefile generic
 endef
 
 define HOST_ZIP_INSTALL_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
 		prefix=$(HOST_DIR)/usr
 endef
 
