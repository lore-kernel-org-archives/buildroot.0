From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Fri, 14 Aug 2020 13:25:24 +0200
Subject: [Buildroot] [PATCH 1/1] package qemu: bump to version 5.1.0
Message-ID: <1597404324-18752-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release 5.1.0 brought new changes like :
- New architecture support for AVR CPUs
- New ARMv8.2 TTS2UXN architecture feature support
- Parameter 'mem' of the '-numa' option is not supported anymore.

See:
https://wiki.qemu.org/ChangeLog/5.1
https://www.qemu.org/2020/08/11/qemu-5-1-0/

Build results available at : https://gitlab.com/jugurthaB/buildroot/-/pipelines/177823315.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 7199d43..317c0b1 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256 2f13a92a0fa5c8b69ff0796b59b86b080bbb92ebad5d301a7724dd06b5e78cb6  qemu-5.0.0.tar.xz
+sha256 c9174eb5933d9eb5e61f541cd6d1184cd3118dfe4c5c4955bc1bdc4d390fa4e5  qemu-5.1.0.tar.xz
 sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c2872a2..69850ec 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 5.0.0
+QEMU_VERSION = 5.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
-- 
2.7.4
