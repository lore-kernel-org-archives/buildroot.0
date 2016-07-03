From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:33:07 +0200
Subject: [Buildroot] [git commit] xfont_encodings: add explicit dependencies
	for host variant
Message-ID: <20160703073819.02E9380288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76ebb4c2b89238016c8ad449e10b17253763bca8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xfont_encodings/xfont_encodings.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 568dbcb..9c5c9f3 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -11,6 +11,8 @@ XFONT_ENCODINGS_LICENSE = Public Domain
 XFONT_ENCODINGS_LICENSE_FILES = COPYING
 
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale host-pkgconf xutil_util-macros
+HOST_XFONT_ENCODINGS_DEPENDENCIES = \
+	host-xapp_mkfontscale host-pkgconf host-xutil_util-macros
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
