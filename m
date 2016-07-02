From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:12 +0200
Subject: [Buildroot] [PATCH 43/69] xfont_encodings: add explicit
	dependencies for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-44-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xfont_encodings/xfont_encodings.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 568dbcbde81f..9c5c9f30bf8b 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -11,6 +11,8 @@ XFONT_ENCODINGS_LICENSE = Public Domain
 XFONT_ENCODINGS_LICENSE_FILES = COPYING
 
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale host-pkgconf xutil_util-macros
+HOST_XFONT_ENCODINGS_DEPENDENCIES = \
+	host-xapp_mkfontscale host-pkgconf host-xutil_util-macros
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0
