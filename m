From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:29:59 +0100
Subject: [Buildroot] [git commit] xserver_xorg-server: enable libunwind for
	MIPS with 32-bit pointers
Message-ID: <20150219213006.53068817B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b58d58c74aba142bc95049100633888e39cd74a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libunwind support was broken for MIPS variants with 32-bit pointers so
we disabled it:

  http://lists.busybox.net/pipermail/buildroot/2014-December/114404.html

But now we have a patch to fix that problem so we can enable it again.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index bde2b95..35bdd44 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -145,9 +145,7 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += freetype
 endif
 
-# libunwind support is broken on all MIPS variants with 32-bit pointers
-# https://bugs.freedesktop.org/show_bug.cgi?id=79939
-ifeq ($(BR2_PACKAGE_LIBUNWIND)-$(BR2_MIPS_OABI32)-$(BR2_MIPS_NABI32),y--)
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += libunwind
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-libunwind
 else
