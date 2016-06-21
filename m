From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 21 Jun 2016 14:56:40 +1000
Subject: [Buildroot] [PATCH v2 0/5] Makefile: Support merged and nested
	defconfigs.
Message-ID: <cover.1466484997.git.sam.bobroff@au1.ibm.com>
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
from the snippets.  The support scripts for merged kernel defconfigs is reused.

Nested defconfig directories allow us to organize the defconfig
directory into sub-directories.  A likely use for this is to place
defconfigs into architecture-specific subdirectories.


Changes v1 -> v2:

This is a complete rework of the config merging system, discarding the .merge
files and instead using Makefile fragments included from the configuration
directories that invoke a Make function. This allows much better error handling
as well as a cleaner looking system (somewhat similar to the package .mk
files).

I've also added some documentation to explain what is supported and an example
to show how it's used.  I haven't touched the documentation before and I'm not
familiar with the formatting so I hope I've done it the right way and that it's
useful (feedback would be great). "make manual-html" seems to work at least.


Elizabeth Liner (1):
  Makefile: Support nested config directories

Patrick Williams (3):
  Makefile: Generate %_defconfig recipes from macro.
  Makefile: Add nested config dirs to list-defconfigs
  Makefile: Add merged defconfigs to list-defconfigs.

Sam Bobroff (1):
  Add support for merged defconfigs

 Makefile                             | 58 +++++++++++++++++++++++++++++-----
 docs/manual/adding-board-support.txt |  3 ++
 docs/manual/appendix.txt             |  1 +
 docs/manual/merged-defconfigs.txt    | 60 ++++++++++++++++++++++++++++++++++++
 4 files changed, 114 insertions(+), 8 deletions(-)
 create mode 100644 docs/manual/merged-defconfigs.txt

-- 
2.1.0
