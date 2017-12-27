From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:32:26 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] qemu: security bump to
 version 2.10.2
Message-ID: <20171227223843.AB8EE8376E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9aae9d93c01a7fdec3e414ed4b231f5538cd7b3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Fixes the following security issues:

CVE-2017-13672: QEMU (aka Quick Emulator), when built with the VGA display
emulator support, allows local guest OS privileged users to cause a denial
of service (out-of-bounds read and QEMU process crash) via vectors involving
display update.

CVE-2017-15118: Stack buffer overflow in NBD server triggered via long
export name

CVE-2017-15119: DoS via large option request

CVE-2017-15268: Qemu through 2.10.0 allows remote attackers to cause a
memory leak by triggering slow data-channel read operations, related to
io/channel-websock.c.

For more details, see the release announcement:
https://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg03618.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eb2b3df62666b0e2dc3042efdfecd7f62513bc9a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index db43c9a..1173c1b 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256 1dd51a908fc68c7d935b0b31fb184c5669bc23b5a1b081816e824714f2a11caa  qemu-2.10.1.tar.xz
+sha256 fcfdaa1ecdaac8aead616fe811bfb8fe4a8f2cd59796aa446c5175b5af0e829f  qemu-2.10.2.tar.xz
 sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256 48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 402ad68..345ef52 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.10.1
+QEMU_VERSION = 2.10.2
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
