From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 Sep 2010 09:22:19 +0200
Subject: [Buildroot] [git commit master 1/1] dropbear: fix xauth tweak since
	dbcec2b2
Message-ID: <20100928072418.368528B6D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d5576fd2f084b1c51a51f14b278b99215366ca80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent conversion to new-style hooks didn't actually enable the
xauth tweaking. Also rename to FIX_XAUTH as it just tweaks the path,
it doesn't disable anything.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dropbear/dropbear.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 0b0d4c7..0457935 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -17,11 +17,11 @@ DROPBEAR_CONF_ENV = ac_cv_type_struct_sockaddr_storage=yes
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
-define DROPBEAR_DISABLE_XAUTH
+define DROPBEAR_FIX_XAUTH
 	$(SED) 's,^#define XAUTH_COMMAND.*/xauth,#define XAUTH_COMMAND "/usr/bin/xauth,g' $(@D)/options.h
 endef
 
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ADJUST_OPTIONS
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_FIX_AUTH
 
 define DROPBEAR_DISABLE_REVERSE_DNS
 	$(SED) 's,^#define DO_HOST_LOOKUP.*,/* #define DO_HOST_LOOKUP */,' $(@D)/options.h
-- 
1.7.1
