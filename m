From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:46:45 +0100
Subject: [Buildroot] [PATCH 07/38] xfont_encoding: add mkfontscale on the
	host as dependency
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b5d695eb36ed0d29e60e3d8dee75a7584323caa3.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
