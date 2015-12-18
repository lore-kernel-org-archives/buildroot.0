From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 10:08:21 +0100
Subject: [Buildroot] [git commit] pkg-download: do not test SITE_METHOD
Message-ID: <20151218090827.248867FA9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef17d6f2cdf814c97af128ef3424170de3e12cfa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SITE_METHOD is always set in inner-generic-package. So, it is useless
to test it in pkg-download.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index f08f616..1332e66 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -223,12 +223,7 @@ define DOWNLOAD_INNER
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
