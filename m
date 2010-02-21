From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:46:51 +0100
Subject: [Buildroot] [PATCH 13/38] ace_of_penguins: add dependency on
	host-libpng
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <843ab1702b43c86195461f93cdef0ca8bd0901d6.1266774432.git.thomas.petazzoni@free-electrons.com>
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
