From: Patrick Williams <patrick@stwcx.xyz>
Date: Wed, 18 May 2016 14:25:24 -0500
Subject: [Buildroot] [PATCH 0/6] Makefile: Support merged and nested
	defconfigs.
Message-ID: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a combination and cleanup of the previous efforts by
Sam Bobroff and Elizabeth Liner to introduce merged defconfigs
and nested defconfig directories respectively.

Merged defconfigs allow us to create defconfig snippets for aspects
that are common across multiple machines and create a combined defconfig
from the snippets.  The support scripts for merged kernel defconfigs is
reused.

Nested defconfig directories allow us to organize the defconfig
directory into sub-directories.  A likely use for this is to place
defconfigs into architecture-specific subdirectories.

Elizabeth Liner (1):
  Makefile: Support nested config directories

Patrick Williams (4):
  Makefile: Generate %_defconfig recipes from macro.
  Makefile: Add nested config dirs to list-defconfigs
  Makefile: Add merged defconfigs to list-defconfigs.
  Makefile: Fix merge defconfig clobber of .config.old

Sam Bobroff (1):
  Makefile: Support merged defconfigs

 Makefile | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

-- 
2.6.3
