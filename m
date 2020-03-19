From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Mar 2020 22:49:00 +0100
Subject: [Buildroot] [PATCH] boot/barebox-ayx: store downloads in same dir
 as bare barebox
Message-ID: <20200319214900.2992-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

barebox and barebox-aux are really the same package, from the same URL
and the same version. They deserve being stored in the same directory.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
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
-- 
2.20.1
