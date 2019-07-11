From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 11 Jul 2019 21:59:12 +0200
Subject: [Buildroot] [git commit] package/json-glib: fix NLS build
Message-ID: <20190711195739.12568813F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff26958c3dfea3c1725f9783b8d3fe15348823d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/a9515ce8acb2d13532d0d43f8f61fa890a4705b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: put LDFLAGS after DEPENDENCIES]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/json-glib/json-glib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 77c0c45323..a312198bba 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -17,4 +17,6 @@ JSON_GLIB_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2
 
+JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
 $(eval $(meson-package))
