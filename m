From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 May 2014 23:18:10 +0200
Subject: [Buildroot] [git commit] libfribidi: depend on host-pkgconf
Message-ID: <20140529212159.418619CE3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ba91e346f66d0bb8479ba6163fdaff6303ef256
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libfribidi needs macros from pkgconf to generate its configure script. Since
commit 5693f236a2a0 (libfribidi: bump version) we AUTORECONF, so host-pkgconf
is also needed.

Fixes:
http://autobuild.buildroot.net/results/5d7/5d76a8333fb05e903460ad51dc0737c18431d033/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfribidi/libfribidi.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index c9130fe..32f414e 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -12,5 +12,6 @@ LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
 # BR's libtool patch doesn't apply
 LIBFRIBIDI_AUTORECONF = YES
+LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
