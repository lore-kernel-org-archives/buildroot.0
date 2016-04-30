From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:19 +0200
Subject: [Buildroot] [PATCH 23/34] pkg-download: allow git+ssh URLs
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-23-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index c86b9ab..f8c5221 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -228,7 +228,7 @@ define DOWNLOAD_INNER
 			scheme="$($(PKG)_SITE_METHOD)" ; \
 		fi ; \
 		case "$$scheme" in \
-			git) $($(3)_GIT) && exit ;; \
+			git|git+ssh) $($(3)_GIT) && exit ;; \
 			svn) $($(3)_SVN) && exit ;; \
 			cvs) $($(3)_CVS) && exit ;; \
 			bzr) $($(3)_BZR) && exit ;; \
-- 
2.7.4
