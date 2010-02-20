From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 19:43:06 +0100
Subject: [Buildroot] [PATCH 15/16] ace_of_penguins: mark as BROKEN
In-Reply-To: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bf37d2e1dfc2249239e95c5a83fbcad4441e6670.1266691382.git.thomas.petazzoni@free-electrons.com>
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
 package/games/ace_of_penguins/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/games/ace_of_penguins/Config.in b/package/games/ace_of_penguins/Config.in
index 1d5a367..2240e7c 100644
--- a/package/games/ace_of_penguins/Config.in
+++ b/package/games/ace_of_penguins/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_ACE_OF_PENGUINS
 	select BR2_PACKAGE_LIBPNG
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_XLIB_LIBXPM
+	depends on BROKEN
 	help
 	  The Ace of Penguins is a set of Unix/X solitaire games based
 	  on the ones available for Windows but with a number of
-- 
1.6.3.3
