From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:50 -0000
Subject: [Buildroot] [git commit branch/next] mpg123: replace $(shell ...)
	call with $(subst ...)
Message-ID: <20150808105633.D1FA080414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d1530f46727c198a688fc4c69e29d22596b0c3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There's no reason to use a shell here.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpg123/mpg123.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 4c534e2..171cbde 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -69,7 +69,7 @@ MPG123_CONF_OPTS += --with-default-audio=alsa
 MPG123_DEPENDENCIES += alsa-lib
 endif
 
-MPG123_CONF_OPTS += --with-audio=$(shell echo $(MPG123_AUDIO) | tr ' ' ,)
+MPG123_CONF_OPTS += --with-audio=$(subst $(space),$(comma),$(MPG123_AUDIO))
 
 ifeq ($(BR2_PACKAGE_LIBTOOL),y)
 MPG123_DEPENDENCIES += libtool
