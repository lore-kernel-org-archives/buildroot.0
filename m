From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Aug 2017 15:41:39 +0200
Subject: [Buildroot] [git commit] mediastreamer: add dependency on host-vim
Message-ID: <20170825133439.526917FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=377d10577bb47dbe5da5799646f2a05c36739547
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-vim is needed to provide the xxd tool, otherwise the build fails
with:

checking for xxd... no
configure: error: "xxd is required (provided by vim package)"

This isn't noticed by the autobuilders, presumably because all of them
have vim installed locally.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mediastreamer/mediastreamer.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 44d9e97..1276cfa 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -7,7 +7,8 @@
 MEDIASTREAMER_VERSION = 2.14.0
 MEDIASTREAMER_SITE = http://download.savannah.nongnu.org/releases/linphone/mediastreamer
 MEDIASTREAMER_INSTALL_STAGING = YES
-MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkgconf ortp host-gettext
+# host-vim needed for the xxd utility
+MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkgconf ortp host-gettext host-vim
 # tests fail linking on some architectures, so disable them
 MEDIASTREAMER_CONF_OPTS = --disable-tests --disable-glx --disable-strict
 MEDIASTREAMER_LICENSE = GPL-2.0+
