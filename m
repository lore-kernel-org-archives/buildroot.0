From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 22:36:17 +0200
Subject: [Buildroot] [git commit] evemu: fix host-python/host-python3
	dependency
Message-ID: <20140721204953.E30569B999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32dd4f4db15c13bf7fbd545fa3b5dc98644c99e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/evemu/evemu.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 385a982..07ad6f6 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -24,8 +24,8 @@ EVEMU_CONF_OPT += --disable-tests
 # Uses PKG_CHECK_MODULES() in configure.ac
 EVEMU_DEPENDENCIES = host-pkgconf libevdev
 
-# Needs Python to generate a wrapper
-EVEMU_DEPENDENCIES += host-python
+# Needs Python for header file generation
+EVEMU_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 
 # package source code coming from git, so it doesn't have generated
 # configure and Makefile.in
