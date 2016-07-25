From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:49:04 +0200
Subject: [Buildroot] [git commit] docs/manual: use TARGET_CONFIGURE_OPTS in
	generic-package tutorial
Message-ID: <20160725213445.D2D60817EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89a33a06022d3b21a633f24566e1f6b6d30df5ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TARGET_CONFIGURE_OPTS is preferred over manually using CC and LD.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index f18465b..ef895ec 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -29,7 +29,7 @@ system is based on hand-written Makefiles or shell scripts.
 14: LIBFOO_DEPENDENCIES = host-libaaa libbbb
 15:
 16: define LIBFOO_BUILD_CMDS
-17:	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+17:	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
 18: endef
 19:
 20: define LIBFOO_INSTALL_STAGING_CMDS
