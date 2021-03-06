From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Mar 2021 18:46:48 +0100
Subject: [Buildroot] [git commit] package/libjpeg: fix LIBJPEG_SITE
Message-ID: <20210306172625.5956981346@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=308f4428c8d8cbe6ea563b295f590a4c3da23646
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b83184de674a (package/libjpeg: switch to s.b.o. as source site)
improperly added a trailing slash '/' at the end of LIBJPEG_SITE,
causing builds to fail:

    package/libjpeg/libjpeg.mk:35: *** LIBJPEG_SITE (http://sources.buildroot.org/libjpeg/) cannot have a trailing slash.  Stop.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libjpeg/libjpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index bd463ad40a..6b55aba7e5 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -9,7 +9,7 @@ LIBJPEG_VERSION = 9d
 # 2021-03, causing hash mismatch. Until there is a new version released,
 # use our cached copy from s.b.o.
 #LIBJPEG_SITE = http://www.ijg.org/files
-LIBJPEG_SITE = http://sources.buildroot.org/libjpeg/
+LIBJPEG_SITE = http://sources.buildroot.org/libjpeg
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = IJG
 LIBJPEG_LICENSE_FILES = README
