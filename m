From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 31 Jan 2011 22:52:47 +0100
Subject: [Buildroot] [PATCH] Makefile.package.in: accept upper case
	$(PKG)_SITE_METHOD as well
Message-ID: <1296510767-15670-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Buildroot documentation says it's OK to use upper case names for
$(PKG)_SITE_METHOD, but the implementation does not support it. This
patch adds support for both upper and lower case names.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 package/Makefile.package.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 92ce4e2..9a327c6 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -189,9 +189,9 @@ define DOWNLOAD
 	fi ; \
 	if test -n "$(1)" ; then \
 		case "$($(PKG)_SITE_METHOD)" in \
-			git) $($(DL_MODE)_GIT) && exit ;; \
-			svn) $($(DL_MODE)_SVN) && exit ;; \
-			bzr) $($(DL_MODE)_BZR) && exit ;; \
+			git|GIT) $($(DL_MODE)_GIT) && exit ;; \
+			svn|SVN) $($(DL_MODE)_SVN) && exit ;; \
+			bzr|BZR) $($(DL_MODE)_BZR) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
-- 
1.7.1
