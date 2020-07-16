From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 Jul 2020 20:53:45 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/lxc: fix license
Message-ID: <20200716185345.1016519-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5a393677314dfdaa6a4bd6a847b642ae54517538 forgot to update
license which has been changed from COPYING to LICENSE.GPL2 and
LICENSE.LGPL2.1 since version 4.0.0 and
https://github.com/lxc/lxc/commit/cc73685dd09315b292968ee91a08a8f295376b35

It should be noted that COPYING describes GPLv3, see upstream answer
here: https://github.com/lxc/lxc/issues/3484

Fixes:
 - http://autobuild.buildroot.org/results/2da182d0b84e2597e135506f8166a54660c4b2f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Specify that GPL-2.0 is for some tools (6 source files)
 - Add link on upstream answer for COPYING

 package/lxc/lxc.hash | 3 ++-
 package/lxc/lxc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index faaa17dde0..411947f165 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  d56d91d772449c57e9a67b770dab8967e412051d8d6246ce56c63264671672e5  lxc-4.0.3.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 0d88cd6c8c..ad26580980 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -6,8 +6,8 @@
 
 LXC_VERSION = 4.0.3
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
-LXC_LICENSE = LGPL-2.1+
-LXC_LICENSE_FILES = COPYING
+LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
+LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
 LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
 
-- 
2.27.0
