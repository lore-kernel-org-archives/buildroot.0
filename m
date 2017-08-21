From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 22:55:16 +0200
Subject: [Buildroot] [PATCH 3/3] mediastreamer: add dependency on host-vim
In-Reply-To: <20170821205516.20620-1-thomas.petazzoni@free-electrons.com>
References: <20170821205516.20620-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170821205516.20620-3-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.9.4
