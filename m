From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:49:11 +0200
Subject: [Buildroot] [git commit] lftp: remove unneeded config options
Message-ID: <20160810125340.668F3817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e56ef31c8c73e942b2484b9f45de9cda15234130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When installation prefix is specified in "--with-readline" config
option, lftp's build systems figures out include dir and linker flags.
So don't specify --with-readline-{inc,libs} options which are anyways
get ignored by build system.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lftp/lftp.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index eab7731..b46b802 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -16,8 +16,6 @@ LFTP_DEPENDENCIES = readline zlib host-pkgconf
 # Help lftp finding readline and zlib
 LFTP_CONF_OPTS = \
 	--with-readline=$(STAGING_DIR)/usr \
-	--with-readline-inc=$(STAGING_DIR)/usr/include/readline \
-	--with-readline-lib=$(STAGING_DIR)/usr/lib \
 	--with-zlib=$(STAGING_DIR)/usr
 
 ifneq ($(BR2_STATIC_LIBS),y)
