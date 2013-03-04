From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 21:19:05 +0100
Subject: [Buildroot] [git commit] ncurses: speed up host build
Message-ID: <20130304203713.369B09A4C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfbfc93cc7b7a9e2cf54736561a41db67ac8e67a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable C++ and Ada bindings in host-ncurses, since those are not
needed. Save 9 seconds of build time on my laptop.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/ncurses.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index e77a0f1..c01dfbc 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -117,7 +117,10 @@ endef
 
 HOST_NCURSES_CONF_OPT = \
 	--without-shared --without-gpm \
-	--without-manpages
+	--without-manpages \
+	--without-cxx \
+	--without-cxx-binding \
+	--without-ada
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
