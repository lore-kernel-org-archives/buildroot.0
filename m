From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2014 14:51:40 +0100
Subject: [Buildroot] [git commit] vorbis-tools: fix libm linking issue
Message-ID: <20140127135230.655D49C684@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b304ff7f7db8018db70374d738371cf20848e194
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/d48/d488dc5e1d684124e7367dac00ba2fb8c7b1b876/

ogg123 calls math functions but forgets to link with libm.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vorbis-tools/vorbis-tools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/vorbis-tools/vorbis-tools.mk b/package/vorbis-tools/vorbis-tools.mk
index 464081e..506f8b9 100644
--- a/package/vorbis-tools/vorbis-tools.mk
+++ b/package/vorbis-tools/vorbis-tools.mk
@@ -10,6 +10,8 @@ VORBIS_TOOLS_LICENSE = GPLv2
 VORBIS_TOOLS_LICENSE_FILES = COPYING
 VORBIS_TOOLS_DEPENDENCIES = libao libogg libvorbis libcurl
 VORBIS_TOOLS_CONF_OPT = --program-transform-name=''
+# ogg123 calls math functions but forgets to link with libm
+VORBIS_TOOLS_CONF_ENV = LIBS=-lm
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
 VORBIS_TOOLS_DEPENDENCIES += flac
