From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 12:57:18 +0100
Subject: [Buildroot] [git commit] live555: fix shared library build on x86
Message-ID: <20141202120522.AF13080075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d782490a5f99422335406b7230e726b68833ac8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-fPIC is required for shared libraries on x86.

Fixes:
http://autobuild.buildroot.net/results/6e7/6e78d3e29856c25d233f1629c31bc15f7ecb2f89/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 7dbded3..0644505 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -19,6 +19,7 @@ LIVE555_LIBRARY_LINK = $(TARGET_AR) cr
 else
 LIVE555_CONFIG_TARGET = linux-with-shared-libraries
 LIVE555_LIBRARY_LINK = $(TARGET_CC) -o
+LIVE555_CFLAGS += -fPIC
 endif
 
 ifndef ($(BR2_ENABLE_LOCALE),y)
