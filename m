From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 16:29:07 +0200
Subject: [Buildroot] [git commit] webkit: fix target install
Message-ID: <20131022143058.F28C49BB3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6e5afc3cc782feda7e7153c8d01c9a7451ba33a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 33a9d34ff375ec0c0389c9af6bc499a8dd7ccbc9 fixed the staging
install for webkit, which was hanging due to deadlock during parallel
make install.

This problem also afflicts the target install, which is fixed by this patch.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkit/webkit.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index eb1547b..21b535f 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -17,6 +17,7 @@ WEBKIT_AUTORECONF_OPT = -I $(@D)/Source/autotools
 
 # parallel make install deadlocks with make 3.81
 WEBKIT_INSTALL_STAGING_OPT = -j1 DESTDIR=$(STAGING_DIR) install
+WEBKIT_INSTALL_TARGET_OPT = -j1 DESTDIR=$(TARGET_DIR) install
 
 # Does not build and it's disabled by default
 # in newer releases
