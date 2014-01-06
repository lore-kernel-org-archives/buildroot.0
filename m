From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jan 2014 11:29:48 +0100
Subject: [Buildroot] [git commit] xkeyboard-config: disable 'runtime deps as
	build time deps'
Message-ID: <20140106103014.D19BB9C25A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ce67935e80b2ea6b24f22ebf1e810eae3dcefe0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/f11/f11687ae661f9d3570c55a9d62a7822e667ad9ad/

xkeyboard-config has runtime dependencies (when using X11) on xproto and
libX11, and by default checks at build time if they are available.

Disable this check as it doesn't apply for wayland and the needed deps are
taken care of by BR for X11.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 05224a7..674d15d 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,6 +10,7 @@ XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-conf
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
+XKEYBOARD_CONFIG_CONF_OPT = --disable-runtime-deps
 XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp
 
 $(eval $(autotools-package))
