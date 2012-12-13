From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Dec 2012 00:51:53 +0100
Subject: [Buildroot] [git commit] package/qemu: fix host dependencies
Message-ID: <20121213235340.283339A1F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a489f1ac87ea86c760271b516419fb81bbfc83d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'host-*' packages should depends on other 'host-*' packages,
not on target packages.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
