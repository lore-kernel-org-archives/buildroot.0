From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 14:48:07 +0200
Subject: [Buildroot] [git commit] package/mono: bump to version 5.20.1.27
Message-ID: <20190501124307.084A1846B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e7dd3e92ea9bf5317388a3ba6d682e38591c30f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps mono to version 5.20.1.27 and it's monolite dependency
to version B886E13F-6276-4BE5-85F8-C6BF5EDBD200.
It also adapt the monolite path to updated mono version.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mono/mono.hash         | 2 +-
 package/mono/mono.mk           | 2 +-
 package/monolite/monolite.hash | 2 +-
 package/monolite/monolite.mk   | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index db7ce52c97..b174f6c51e 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256 d4f5fa2e8188d66fbc8054f4145711e45c1faa6d070e63600efab93d1d189498  mono-5.14.0.177.tar.bz2
+sha256 5e829e143a0180dc1f1129333b8370442c2ada91b6cc91940d4d096278e73797  mono-5.20.1.27.tar.bz2
 sha256 3b40a54878b5ac2767a764bd082f8772ab27c03b9da9c7328c4c4935725556f7  LICENSE
 sha256 fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
 sha256 2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 62eaeaf8b4..bb482a6d5f 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 5.14.0.177
+MONO_VERSION = 5.20.1.27
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index cf72916855..486454eba5 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 bb4b3b12b9ff04b219ad00dcea78145475d756a1c22ad84e0db978a8eee8c654  monolite-linux-1051400005-latest.tar.gz
+sha256 0694caa24daef80b51addd1e1f5c8a117712c0e5c16e2a1e122e3c015ebd5bba  monolite-linux-B886E13F-6276-4BE5-85F8-C6BF5EDBD200-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 2e1e54a549..874b24388d 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 1051400005
+MONOLITE_VERSION = B886E13F-6276-4BE5-85F8-C6BF5EDBD200
 MONOLITE_SITE = http://download.mono-project.com/monolite
 MONOLITE_SOURCE = monolite-linux-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
 
 define HOST_MONOLITE_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/lib/monolite/$(MONOLITE_VERSION)
-	cp -r $(@D)/* $(HOST_DIR)/lib/monolite/$(MONOLITE_VERSION)
+	mkdir -p $(HOST_DIR)/lib/monolite-linux/$(MONOLITE_VERSION)
+	cp -r $(@D)/* $(HOST_DIR)/lib/monolite-linux/$(MONOLITE_VERSION)
 endef
 
 $(eval $(host-generic-package))
