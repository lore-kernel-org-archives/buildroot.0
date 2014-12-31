From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 15:15:01 +0100
Subject: [Buildroot] [git commit] svgtiny: update source url
Message-ID: <20141231141528.56029807F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f9b5f657b3dbb82a5725c3bf24ed261a77111d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As source url use the git repository instead of the unavaiable svn
repository.

This fix the following error:

svn: E670002: Unable to connect to a repository at URL 'svn://svn.netsurf-browser.org/trunk/libsvgtiny'
svn: E670002: Unknown hostname 'svn.netsurf-browser.org'

[Thomas: use http:// access to the Git repository, as suggested by
Baruch.]

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsvgtiny/libsvgtiny.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index a2d494e..46f4923 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
-LIBSVGTINY_VERSION = 12121
+LIBSVGTINY_SITE = http://git.netsurf-browser.org/libsvgtiny.git
+LIBSVGTINY_SITE_METHOD = git
+LIBSVGTINY_VERSION = ea9d99fc8b231c22d06168135e181d61f4eb2f06
 LIBSVGTINY_INSTALL_STAGING = YES
 LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
 LIBSVGTINY_LICENSE = MIT
