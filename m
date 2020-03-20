From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 19:56:18 +0100
Subject: [Buildroot] [git commit] boot/barebox-aux: store downloads in same
 dir as bare barebox
Message-ID: <20200320200717.C6C4382976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca7fa117b168e0de81dda35c8cabb615c352a0e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

barebox and barebox-aux are really the same package, from the same URL
and the same version. They deserve being stored in the same directory.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/barebox/barebox.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index f11f9950d1..3d7492598f 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -31,6 +31,8 @@ $(1)_SOURCE = barebox-$$($(1)_VERSION).tar.bz2
 $(1)_SITE = https://www.barebox.org/download
 endif
 
+$(1)_DL_SUBDIR = barebox
+
 $(1)_DEPENDENCIES = host-lzop
 $(1)_LICENSE = GPL-2.0 with exceptions
 ifeq ($(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
