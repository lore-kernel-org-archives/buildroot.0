From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Feb 2013 18:27:51 +0100
Subject: [Buildroot] [PATCH 2/2] ncurses: speed up host build
In-Reply-To: <1361726871-18016-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1361726871-18016-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1361726871-18016-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable C++ and Ada bindings in host-ncurses, since those are not
needed. Save 9 seconds of build time on my laptop.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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
-- 
1.7.9.5
