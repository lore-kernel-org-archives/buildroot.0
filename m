From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 May 2011 12:04:10 +0200
Subject: [Buildroot] [git commit] dropbear: link statically if
	BR2_PREFER_STATIC_LIB
Message-ID: <20110513100601.30709834D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7fec8e8b753a77f4635dfa74819bb75354b90ee1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dropbear/dropbear.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index b36c278..d73e993 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -12,6 +12,10 @@ DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+DROPBEAR_MAKE += STATIC=1
+endif
+
 define DROPBEAR_FIX_XAUTH
 	$(SED) 's,^#define XAUTH_COMMAND.*/xauth,#define XAUTH_COMMAND "/usr/bin/xauth,g' $(@D)/options.h
 endef
-- 
1.7.3.4
