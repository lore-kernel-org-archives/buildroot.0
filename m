From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] aufs-util: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132039.A722280335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1d218b7447d60c00aff8f71a29206a526b400d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In this case in particular a host tool is built inside the target build
step.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aufs-util/aufs-util.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
index a2d0bad..d41b4ac 100644
--- a/package/aufs-util/aufs-util.mk
+++ b/package/aufs-util/aufs-util.mk
@@ -41,7 +41,7 @@ AUFS_UTIL_POST_PATCH_HOOKS += AUFS_UTIL_REMOVE_RDU64
 
 # First, we build the host tools, needed to build the target tools.
 define AUFS_UTIL_BUILD_CMDS
-	$(MAKE) -C $(@D) \
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
 		CPPFLAGS="$(AUFS_UTIL_HOST_CPPFLAGS)" \
 		HOSTCC="$(HOSTCC)" HOSTLD="$(HOSTLD)" \
