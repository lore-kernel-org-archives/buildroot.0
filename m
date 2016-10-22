From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] libsemanage: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132037.E84A87F925@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0547150d9131bda611c9362ca555f32cd2dbb526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsemanage/libsemanage.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 9effea0..005b822 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -49,13 +49,13 @@ endif
 define HOST_LIBSEMANAGE_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
-	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) all
-	$(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) all
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
 endef
 
 define HOST_LIBSEMANAGE_INSTALL_CMDS
-	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) install
-	$(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
 endef
 
 $(eval $(generic-package))
