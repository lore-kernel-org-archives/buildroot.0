From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 19 Nov 2015 11:36:02 +0100
Subject: [Buildroot] [PATCH 1/5] pkg-download: do not test SITE_METHOD
In-Reply-To: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
References: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
Message-ID: <1447929366-8972-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SITE_METHOD is always set in inner-generic-package. So, it is useless
to test it in pkg-download.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/pkg-download.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index c86b9ab..757bafe 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -222,12 +222,7 @@ define DOWNLOAD_INNER
 		exit 1 ; \
 	fi ; \
 	if test -n "$(1)" ; then \
-		if test -z "$($(PKG)_SITE_METHOD)" ; then \
-			scheme="$(call geturischeme,$(1))" ; \
-		else \
-			scheme="$($(PKG)_SITE_METHOD)" ; \
-		fi ; \
-		case "$$scheme" in \
+		case "$($(PKG)_SITE_METHOD)" in \
 			git) $($(3)_GIT) && exit ;; \
 			svn) $($(3)_SVN) && exit ;; \
 			cvs) $($(3)_CVS) && exit ;; \
-- 
2.1.4
