From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] ace_of_penguins: mark as BROKEN
Message-ID: <20100223202926.AF482776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7452b4edfa1c8385d602950bcaeb2cb3afdfdf3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is BROKEN in the way it compiles make-imglib and text2c
for the host while being in cross-compiled mode. It does not use
CC_FOR_BUILD and CFLAGS_FOR_BUILD as it should.

No upstream release has been made since 2001 and since it is a
relatively useless package, I don't think it's worth the trouble to
sanitize its build system.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/games/ace_of_penguins/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/games/ace_of_penguins/Config.in b/package/games/ace_of_penguins/Config.in
index 1d5a367..b3015c6 100644
--- a/package/games/ace_of_penguins/Config.in
+++ b/package/games/ace_of_penguins/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_ACE_OF_PENGUINS
 	select BR2_PACKAGE_LIBPNG
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_XLIB_LIBXPM
+	# Build system is broken for tools that need to be compiled
+	# on the host
+	depends on BROKEN
 	help
 	  The Ace of Penguins is a set of Unix/X solitaire games based
 	  on the ones available for Windows but with a number of
-- 
1.6.3.3
