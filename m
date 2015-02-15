From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 15 Feb 2015 18:10:59 +0000
Subject: [Buildroot] [PATCH 2/2] xserver_xorg-server: enable libunwind for
	MIPS with 32-bit pointers
In-Reply-To: <1424023859-37365-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1424023859-37365-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1424023859-37365-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libunwind support was broken for MIPS variants with 32-bit pointers so
we disabled it:

  http://lists.busybox.net/pipermail/buildroot/2014-December/114404.html

But now we have a patch to fix that problem so we can enable it again.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index a9b9921..9596f9a 100644
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
-- 
1.7.1
