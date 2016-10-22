From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] sepolgen: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132039.7D4D57F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acd088c23d94c91930599452284376731903ff8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sepolgen/sepolgen.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
index 7c95866..efecee7 100644
--- a/package/sepolgen/sepolgen.mk
+++ b/package/sepolgen/sepolgen.mk
@@ -20,11 +20,11 @@ HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
 endif
 
 define HOST_SEPOLGEN_BUILD_CMDS
-	$(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR)
 endef
 
 define HOST_SEPOLGEN_INSTALL_CMDS
-	$(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR) install
 endef
 
 $(eval $(host-generic-package))
