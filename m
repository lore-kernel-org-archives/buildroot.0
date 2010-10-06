From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Oct 2010 09:45:12 +0200
Subject: [Buildroot] [git commit master 1/1] dropbear: really fix xauth
	tweak since dbcec2b2
Message-ID: <20101006074613.E82038B801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=36a5ccd0235c22491158634cef40cbdac278c53c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d5576fd2 tried to fix this, but introduced a new typo.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dropbear/dropbear.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 0457935..b07cb63 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -21,7 +21,7 @@ define DROPBEAR_FIX_XAUTH
 	$(SED) 's,^#define XAUTH_COMMAND.*/xauth,#define XAUTH_COMMAND "/usr/bin/xauth,g' $(@D)/options.h
 endef
 
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_FIX_AUTH
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_FIX_XAUTH
 
 define DROPBEAR_DISABLE_REVERSE_DNS
 	$(SED) 's,^#define DO_HOST_LOOKUP.*,/* #define DO_HOST_LOOKUP */,' $(@D)/options.h
-- 
1.7.1
