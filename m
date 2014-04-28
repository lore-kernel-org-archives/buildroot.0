From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 29 Apr 2014 00:13:17 +0200
Subject: [Buildroot] [Patch v2 2/4] evemu: fix host-python/host-python3
	dependency
In-Reply-To: <1398723199-10978-1-git-send-email-ps.report@gmx.net>
References: <1398723199-10978-1-git-send-email-ps.report@gmx.net>
Message-ID: <1398723199-10978-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1 -> v2:
  - add Reviewed-by
---
 package/evemu/evemu.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.1.4
