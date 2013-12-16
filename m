From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 15:58:36 +0100
Subject: [Buildroot] [git commit] pkg-generic.mk: handle packages under
	toolchain
Message-ID: <20131216150821.04C909BD0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e8015d4651a77a40a9ffe48051e53baecc20ced
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

E.G. for toolchain-buildroot / toolchain-external. Now these packages are
correctly handled by make source / external-deps.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1fce71b..45b808a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -509,6 +509,8 @@ ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
 else ifeq ($(4),boot/)
 $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
+else ifeq ($(4),toolchain/)
+$(2)_KCONFIG_VAR = BR2_$(2)
 else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
 endif
