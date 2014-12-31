From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 31 Dec 2014 10:31:20 +0100
Subject: [Buildroot] [PATCH] svgtiny: update source url
Message-ID: <1420018280-28316-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As source url use the git repository instead of the unavaiable svn
repository.

This fix the following error:

svn: E670002: Unable to connect to a repository at URL 'svn://svn.netsurf-browser.org/trunk/libsvgtiny'
svn: E670002: Unknown hostname 'svn.netsurf-browser.org'

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libsvgtiny/libsvgtiny.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index a2d494e..ee2bb8a 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
-LIBSVGTINY_VERSION = 12121
+LIBSVGTINY_SITE = git://git.netsurf-browser.org/libsvgtiny.git
+LIBSVGTINY_VERSION = ea9d99fc8b231c22d06168135e181d61f4eb2f06
 LIBSVGTINY_INSTALL_STAGING = YES
 LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
 LIBSVGTINY_LICENSE = MIT
-- 
2.1.0
