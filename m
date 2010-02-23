From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] xfont_encoding: add mkfontscale on
	the host as dependency
Message-ID: <20100223202923.81DCE776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d61ed6f32207ced6d7afa0d45473b63a0acf248d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mkfontscale on the host is needed to build xfont_encoding, therefore
we add host-xapp_mkfontscale as a dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xfont_encodings/xfont_encodings.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 74256d1..9097735 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -9,5 +9,6 @@ XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
 XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_AUTORECONF = NO
 XFONT_ENCODINGS_MAKE_OPT =
+XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_encodings))
-- 
1.6.3.3
