From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 20:33:34 +0100
Subject: [Buildroot] [git commit] package/e2fsprogs: security bump to
 version 1.45.5
Message-ID: <20200205192331.8509A83B98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31b8b08b47043044be38b3c50b9e872a150ac8e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes CVE-2019-5188:
A code execution vulnerability exists in the directory rehashing
functionality of E2fsprogs e2fsck 1.45.4. A specially crafted ext4
directory can cause an out-of-bounds write on the stack, resulting
in code execution. An attacker can corrupt a partition to trigger
this vulnerability.

Also change the hash file to the new spacing convention introduced
by Yann E. Morin.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/e2fsprogs/e2fsprogs.hash | 10 +++++-----
 package/e2fsprogs/e2fsprogs.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index c9018715c7..3ecbe4eaa7 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,6 +1,6 @@
-# https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.4/sha256sums.asc
-sha256 65faf6b590ca1da97440d6446bd11de9e0914b42553740ba5d9d2a796fa0dc02  e2fsprogs-1.45.4.tar.xz
+# https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.5/sha256sums.asc
+sha256  f9faccc0d90f73556e797dc7cc5979b582bd50d3f8609c0f2ad48c736d44aede  e2fsprogs-1.45.5.tar.xz
 # Locally calculated
-sha256 5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
-sha256 032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
-sha256 47182fe6631a32f271a15bbe210751b3825b7199f588879aac7d4804fc8b4b8f  lib/et/internal.h
+sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
+sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
+sha256  47182fe6631a32f271a15bbe210751b3825b7199f588879aac7d4804fc8b4b8f  lib/et/internal.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 28fd78047f..fd59f701d6 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.45.4
+E2FSPROGS_VERSION = 1.45.5
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
