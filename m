From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Wed,  3 Mar 2021 14:39:39 -0600
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version e663439
Message-ID: <20210303203939.129235-1-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include the following changes:

e663439 Always fsync file writes
80b7f31 Treat '=' as an illegal character in variable names
950f541 libuboot_env: fix calculation of usable envsize
fb88032 Correct initialisations in libuboot_configure
20d1ec7 Force writing of environment if default is used
5ca11bd libuboot_env: correct length to usable env size length
cd4a8f1 libuboot_env_store: fix env double-null termination
9510164 uboot_env: fix infinite loop on short read (EOF)

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 package/libubootenv/libubootenv.hash | 2 +-
 package/libubootenv/libubootenv.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index a655ed2349..0b5320b36f 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4c52dd908b69f18cdd5721b3f24573fb276e61115f66edb74906d766ca60399f  libubootenv-0.3.1.tar.gz
+sha256  e25adf81dd2d4a083cb2cf032843a1ee2bb1fab54aa7a0202bd2295186bfe1b7  libubootenv-e663439e3d39a4cdbddb7e818245a99c485fa965.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 61516710a7..7a98f5324b 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 0.3.1
-LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
+LIBUBOOTENV_VERSION = e663439e3d39a4cdbddb7e818245a99c485fa965
+LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1
 LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
 LIBUBOOTENV_INSTALL_STAGING = YES
-- 
2.29.1
