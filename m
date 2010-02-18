From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2010 00:36:04 +0100
Subject: [Buildroot] [PATCH 1/3] Add libxpm as a dependency of
	ace_of_penguins
In-Reply-To: <cover.1266536162.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266536162.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3df93063da925eb9787be0a98ce88d079173f762.1266536162.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ace_of_penguins fails to build when xlib_libXpm is not selected. Add
it has a dependency. However, contrary to normal dependencies to
libraries (where we use 'select') we use 'depends on' here, otherwise
the X.org server will be get selected automatically without the user
noticing.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/games/ace_of_penguins/Config.in          |    1 +
 package/games/ace_of_penguins/ace_of_penguins.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/games/ace_of_penguins/Config.in b/package/games/ace_of_penguins/Config.in
index edbaf26..1d5a367 100644
--- a/package/games/ace_of_penguins/Config.in
+++ b/package/games/ace_of_penguins/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_ACE_OF_PENGUINS
 	bool "ace_of_penguins"
 	select BR2_PACKAGE_LIBPNG
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XLIB_LIBXPM
 	help
 	  The Ace of Penguins is a set of Unix/X solitaire games based
 	  on the ones available for Windows but with a number of
diff --git a/package/games/ace_of_penguins/ace_of_penguins.mk b/package/games/ace_of_penguins/ace_of_penguins.mk
index 65a2667..fe3e204 100644
--- a/package/games/ace_of_penguins/ace_of_penguins.mk
+++ b/package/games/ace_of_penguins/ace_of_penguins.mk
@@ -10,6 +10,6 @@ ACE_OF_PENGUINS_AUTORECONF = YES
 ACE_OF_PENGUINS_STAGING = NO
 ACE_OF_PENGUINS_TARGET = YES
 
-ACE_OF_PENGUINS_DEPENDENCIES = libpng xserver_xorg-server
+ACE_OF_PENGUINS_DEPENDENCIES = libpng xserver_xorg-server xlib_libXpm
 
 $(eval $(call AUTOTARGETS,package/games,ace_of_penguins))
-- 
1.6.3.3
