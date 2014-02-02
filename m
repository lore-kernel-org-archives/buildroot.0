From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2014 10:32:19 +0100
Subject: [Buildroot] [git commit] infozip: add missing optional bzip2
	dependencie
Message-ID: <20140202093331.66D2A9BE56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d6dc640aec8b50ae88301a8ce7baa2a31fe88f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/infozip/infozip.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 8a356cf..8e51224 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -10,6 +10,10 @@ INFOZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
 INFOZIP_LICENSE = Info-ZIP
 INFOZIP_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+INFOZIP_DEPENDENCIES += bzip2
+endif
+
 define INFOZIP_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(TARGET_CFLAGS) -I. -DUNIX" \
