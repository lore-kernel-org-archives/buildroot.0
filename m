From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Dec 2012 12:22:53 +0100
Subject: [Buildroot] [git commit] jpeg: fix make source
Message-ID: <20121217112849.CF7AE9A284@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7cba1dead6ce53ccd8ea1c634fc9589f1b2e956e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'make source' fails because the host-jpeg-source target doesn't exist
anymore. Fix this by adding this target explicitly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jpeg/jpeg.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 9f40e6f..3caacaa 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -7,3 +7,4 @@
 jpeg: $(if $(BR2_PACKAGE_JPEG_TURBO),jpeg-turbo,libjpeg)
 
 host-jpeg: host-libjpeg
+host-jpeg-source: host-libjpeg-source
