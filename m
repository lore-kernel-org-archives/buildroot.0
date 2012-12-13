From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Dec 2012 22:39:38 +0100
Subject: [Buildroot] [PATCH 2/4] package/qemu: fix host dependencies
In-Reply-To: <cover.1355434710.git.yann.morin.1998@free.fr>
References: <cover.1355434710.git.yann.morin.1998@free.fr>
Message-ID: <f3379896be4cbb7b0c1348fb207ecd6696702842.1355434710.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'host-*' packages should depends on other 'host-*' packages,
not on target packages.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
---
 package/qemu/qemu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 81cd79f..2c0dbde 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -16,7 +16,7 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-pkgconf zlib libglib2
+HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2
 
 #       BR ARCH         qemu
 #       -------         ----
-- 
1.7.2.5
