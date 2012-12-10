From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Dec 2012 00:44:23 +0100
Subject: [Buildroot] [PATCH 03/52] package/qemu: fix host dependencies
In-Reply-To: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
References: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355183112-10735-4-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'host-*' packages should depends on other 'host-*' packages,
not on target packages.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
