From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 23:44:28 +0200
Subject: [Buildroot] [git commit] package/gcc: fix ARC failure to build in 2
	phases.
Message-ID: <20150702214511.CA36281894@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba0cbd021c63ec32c537bb9e207ab9d0b548bf4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When working with GCC initial at override source dir mode the
HOST_GCC_INITIAL_POST_PATCH_HOOKS is not called and compilation failes.
The solution is to use HOST_GCC_INITIAL_POST_RSYNC_HOOKS since this hook
is being called at override source dir mode.

Signed-off-by: Tal Zilcer <talz@ezchip.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-initial/gcc-initial.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 0fa2353..6bb7997 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -34,6 +34,7 @@ define HOST_GCC_INITIAL_DISABLE_LIBGMON
 		$(@D)/libgcc/config.host
 endef
 HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
+HOST_GCC_INITIAL_POST_RSYNC_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
 endif
 
 HOST_GCC_INITIAL_CONF_OPTS = \
