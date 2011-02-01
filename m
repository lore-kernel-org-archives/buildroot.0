From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Tue,  1 Feb 2011 12:18:49 +0100
Subject: [Buildroot] [PATCH] Makefile.package.in: fix upper case
	$(PKG)_SITE_METHOD
Message-ID: <1296559129-5595-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Buildroot documentation says $(PKG)_SITE_METHOD can be set to upper
case names like SVN or GIT, but the actual implementation (currently)
accepts lower case. This patch changes lower case to upper case in the
implementation to stay in sync with the documentation.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 package/Makefile.package.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 92ce4e2..c3e7dd1 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -189,9 +189,9 @@ define DOWNLOAD
 	fi ; \
 	if test -n "$(1)" ; then \
 		case "$($(PKG)_SITE_METHOD)" in \
-			git) $($(DL_MODE)_GIT) && exit ;; \
-			svn) $($(DL_MODE)_SVN) && exit ;; \
-			bzr) $($(DL_MODE)_BZR) && exit ;; \
+			GIT) $($(DL_MODE)_GIT) && exit ;; \
+			SVN) $($(DL_MODE)_SVN) && exit ;; \
+			BZR) $($(DL_MODE)_BZR) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
-- 
1.7.1
