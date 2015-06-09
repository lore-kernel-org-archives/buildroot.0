From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:09:20 +0200
Subject: [Buildroot] [git commit] package/matchbox: xlib_libXfixes is an
	optional dependency
Message-ID: <20150609211053.03D5C7FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=890bfa58d5b26459b3d43d5998906f9ee0178d05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

matchbox can use xlib_libXfixes to completely and really hide the
cursor, so build-depend on it if enabled.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/matchbox.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 3b6a0eb..9094b1e 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -39,4 +39,8 @@ ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
 MATCHBOX_DEPENDENCIES += xlib_libXcursor
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+MATCHBOX_DEPENDENCIES += xlib_libXfixes
+endif
+
 $(eval $(autotools-package))
