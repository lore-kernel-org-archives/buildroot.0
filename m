From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:11:17 +0200
Subject: [Buildroot] [PATCH 3/5] pkg-download: allow ssh URLs
In-Reply-To: <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465917079-30473-3-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use git when such an URL is met.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index a0f694d..5f7a155 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -225,7 +225,7 @@ define DOWNLOAD_INNER
 	fi ; \
 	if test -n "$(1)" ; then \
 		case "$($(PKG)_SITE_METHOD)" in \
-			git) $($(3)_GIT) && exit ;; \
+			git|ssh) $($(3)_GIT) && exit ;; \
 			svn) $($(3)_SVN) && exit ;; \
 			cvs) $($(3)_CVS) && exit ;; \
 			bzr) $($(3)_BZR) && exit ;; \
-- 
2.8.2
