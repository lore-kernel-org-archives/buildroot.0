From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:38 +0100
Subject: [Buildroot] [PATCH 14/40] ace_of_penguins: mark as BROKEN
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7452b4edfa1c8385d602950bcaeb2cb3afdfdf3c.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
