From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:06 +0200
Subject: [Buildroot] [git commit] package/busybox: add dependency on attr
Message-ID: <20180708110811.7B712863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59234f1425e0b1c90d46a1b86bd93c2b0b8056a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

attr and busybox may each install setfattr, so attr must be installed
before busybox.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 0a9af9f17b..5266f844b6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_ATTR),attr) \
 	$(if $(BR2_PACKAGE_BASH),bash) \
 	$(if $(BR2_PACKAGE_BC),bc) \
 	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
