From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 17 Dec 2012 12:18:31 +0100
Subject: [Buildroot] [PATCH] jpeg: fix make source
Message-ID: <1355743111-18183-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'make source' fails because the host-jpeg-source target doesn't exist
anymore. Fix this by adding this target explicitly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Note that this is only necessary because of the rather twisted way that
the top-level target and dependency lists are generated. Now that all
packages have been converted to gentargets it would probably be possible
to create all necessary dependencies in the package-generic macro, which
would remove the need for this patch.

 package/jpeg/jpeg.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 9f40e6f..3caacaa 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -7,3 +7,4 @@
 jpeg: $(if $(BR2_PACKAGE_JPEG_TURBO),jpeg-turbo,libjpeg)
 
 host-jpeg: host-libjpeg
+host-jpeg-source: host-libjpeg-source
-- 
tg: (8286d71..) t/jpeg (depends on: master)
