From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Nov 2012 20:05:34 +0100
Subject: [Buildroot] [git commit] gqview: Fix build failure due to missing
	-lm with binutils 2.22
Message-ID: <20121107190646.7DA8599C3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c957f604d53d75e851370b6e0503388c93501e87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gqview/gqview.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index e6d764d..6f64175 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -7,6 +7,7 @@ GQVIEW_VERSION = 2.1.5
 GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
 GQVIEW_DEPENDENCIES = host-pkgconf libgtk2
+GQVIEW_CONF_ENV = LIBS="-lm"
 
 $(eval $(autotools-package))
 
