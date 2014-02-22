From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 23:56:39 +0100
Subject: [Buildroot] [git commit] binutils: install libiberty
Message-ID: <20140222230556.8248B8270D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70ee9fcdfcf6fc7cb214e454afe55cbffec84621
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages (actually, just oprofile) need to link against libiberty.
This option just installs libiberty.a so it has no effect on the target,
therefore it's not needed to add a config option for it.

Before binutils-2.24, there was a bug in libiberty/Makefile.in that
caused libiberty to be installed regardless of the
--enable-install-libiberty option. This problem wasn't noticed before
because binutils-2.24 is not selected on any of the autobuilders: the
version can only be selected if an internal toolchain is used, and it
defaults to 2.21.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/binutils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d6828f5..b5a2dc7 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -51,6 +51,7 @@ endif
 BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 		--host=$(GNU_TARGET_NAME) \
 		--target=$(GNU_TARGET_NAME) \
+		--enable-install-libiberty \
 		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # Install binutils after busybox to prefer full-blown utilities
