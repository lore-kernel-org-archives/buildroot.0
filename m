From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 13:04:12 +0200
Subject: [Buildroot] [git commit] package/openswan: fix parallel build
Message-ID: <20150714110436.0319F81955@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=931ee9c1ae2f4e3507d16e394c34c719803c294f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/2ec/2ecb098b01bd44d75182b15f98c1fd2a8c927438/
    http://autobuild.buildroot.org/results/18f/18f0166f3fa831f321818e286d9c2e9037f8c8d0/
    ...

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openswan/openswan.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 6c6a8a7..b7689c1 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -29,12 +29,12 @@ endif
 endif
 
 define OPENSWAN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
 		$(OPENSWAN_MAKE_OPTS) programs
 endef
 
 define OPENSWAN_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
 		$(OPENSWAN_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
