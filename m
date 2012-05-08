From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 May 2012 00:30:22 +0200
Subject: [Buildroot] [git commit] m4: not available on noMMU platforms
Message-ID: <20120508223206.8DE1C96C78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad732e63fcb4969a1f7977f342188807f16371c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/m4/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/m4/Config.in b/package/m4/Config.in
index 56b2859..dee2d83 100644
--- a/package/m4/Config.in
+++ b/package/m4/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_M4
 	bool "m4"
 	depends on BR2_USE_WCHAR
+	# uses fork()
+	depends on BR2_USE_MMU
 	help
 	  An implementation of the traditional Unix macro processor.
 
