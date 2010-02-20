From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 19:43:04 +0100
Subject: [Buildroot] [PATCH 13/16] ace_of_penguins: add dependency on
	host-libpng
In-Reply-To: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <da6e8e3596a64bc188dfa550960a7ef208ad8201.1266691382.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpng is needed on the host to build the make-imglib utility, built
during the compilation of ace_of_penguins for the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/games/ace_of_penguins/ace_of_penguins.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/games/ace_of_penguins/ace_of_penguins.mk b/package/games/ace_of_penguins/ace_of_penguins.mk
index fe3e204..a106d14 100644
--- a/package/games/ace_of_penguins/ace_of_penguins.mk
+++ b/package/games/ace_of_penguins/ace_of_penguins.mk
@@ -10,6 +10,6 @@ ACE_OF_PENGUINS_AUTORECONF = YES
 ACE_OF_PENGUINS_STAGING = NO
 ACE_OF_PENGUINS_TARGET = YES
 
-ACE_OF_PENGUINS_DEPENDENCIES = libpng xserver_xorg-server xlib_libXpm
+ACE_OF_PENGUINS_DEPENDENCIES = libpng host-libpng xserver_xorg-server xlib_libXpm
 
 $(eval $(call AUTOTARGETS,package/games,ace_of_penguins))
-- 
1.6.3.3
