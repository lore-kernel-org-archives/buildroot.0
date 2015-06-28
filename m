From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 28 Jun 2015 13:00:28 +0200
Subject: [Buildroot] [PATCH] package/vlc: install vlc libraries in staging
Message-ID: <1435489228-7010-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although no package seems to link against vlc libraries right now, these
libraries will be necessary for upcoming new efl emotion-generic-players
package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/vlc/vlc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index acd67ee..bc2966e 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -12,6 +12,9 @@ VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_DEPENDENCIES = host-pkgconf
 VLC_AUTORECONF = YES
 
+# Install vlc libraries in staging.
+VLC_INSTALL_STAGING = YES
+
 # VLC defines two autoconf functions which are also defined by our own pkg.m4
 # from pkgconf. Unfortunately, they are defined in a different way: VLC adds
 # --enable- options, but pkg.m4 adds --with- options. To make sure we use
-- 
2.4.3
