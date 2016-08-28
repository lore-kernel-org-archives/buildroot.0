From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Aug 2016 20:19:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/sconeserver: needs host-pkgconf
Message-ID: <1472408394-20573-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sconeserver uses pkg-config macros, so it needs host-pkgconf.

Reported-by: Matthew Weber <matt@thewebers.ws>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/sconeserver/sconeserver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index e02c1a6..42901c6 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -10,7 +10,7 @@ SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
 # fetching from Git, we need to generate the configure script
 SCONESERVER_AUTORECONF = YES
-SCONESERVER_DEPENDENCIES += pcre
+SCONESERVER_DEPENDENCIES = host-pkgconf pcre
 # disable markdown module because its git submodule cmark
 # https://github.com/sconemad/sconeserver/tree/master/markdown
 # has no cross-compile support provided by the sconeserver build system
-- 
2.7.4
