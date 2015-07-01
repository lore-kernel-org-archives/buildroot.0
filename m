From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed,  1 Jul 2015 09:49:24 +0300
Subject: [Buildroot] [PATCH] ARC: update folders with patches for
	arc-2015.06-rc1 release
Message-ID: <1435733364-4979-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In buildroot we maintain a couple off-the-tree patches.
In particular for binutils and gcc packages.

Because we have many versions of mentioned packages patches for each
particular version reside in a folder which name matches full version
name of the package.

For example we used to have patches for binutils distributed as part of
arc-2014.12 tools in folder ""package/binutils/arc-2014.12". Now with
bump of ARC tools version we need to rename folder with patches to
"arc-2015.06-rc1".

The same applies to gcc.

Should fix http://autobuild.buildroot.net/results/2b2/2b27a4a64c0b225ae479ecfccf7a97f5ea95598c/
As discussed before it's not possible to reproduce reported problem on recent
Fedora 21/22 distros (at least we know about them) but I may confirm that
patches were applied fine and everything was built well. Hopefully reported
build failure goes away now.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../binutils/{arc-2014.12 => arc-2015.06-rc1}/0001-PR-other-56780.patch   | 0
 .../{arc-2014.12 => arc-2015.06-rc1}/600-poison-system-directories.patch  | 0
 .../gcc/{arc-2014.12 => arc-2015.06-rc1}/100-libstdcxx-uclibc-c99.patch   | 0
 package/gcc/{arc-2014.12 => arc-2015.06-rc1}/851-PR-other-56780.patch     | 0
 .../910-gcc-poison-system-directories.patch                               | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename package/binutils/{arc-2014.12 => arc-2015.06-rc1}/0001-PR-other-56780.patch (100%)
 rename package/binutils/{arc-2014.12 => arc-2015.06-rc1}/600-poison-system-directories.patch (100%)
 rename package/gcc/{arc-2014.12 => arc-2015.06-rc1}/100-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{arc-2014.12 => arc-2015.06-rc1}/851-PR-other-56780.patch (100%)
 rename package/gcc/{arc-2014.12 => arc-2015.06-rc1}/910-gcc-poison-system-directories.patch (100%)

diff --git a/package/binutils/arc-2014.12/0001-PR-other-56780.patch b/package/binutils/arc-2015.06-rc1/0001-PR-other-56780.patch
similarity index 100%
rename from package/binutils/arc-2014.12/0001-PR-other-56780.patch
rename to package/binutils/arc-2015.06-rc1/0001-PR-other-56780.patch
diff --git a/package/binutils/arc-2014.12/600-poison-system-directories.patch b/package/binutils/arc-2015.06-rc1/600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2014.12/600-poison-system-directories.patch
rename to package/binutils/arc-2015.06-rc1/600-poison-system-directories.patch
diff --git a/package/gcc/arc-2014.12/100-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2015.06-rc1/100-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/arc-2014.12/100-libstdcxx-uclibc-c99.patch
rename to package/gcc/arc-2015.06-rc1/100-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/arc-2014.12/851-PR-other-56780.patch b/package/gcc/arc-2015.06-rc1/851-PR-other-56780.patch
similarity index 100%
rename from package/gcc/arc-2014.12/851-PR-other-56780.patch
rename to package/gcc/arc-2015.06-rc1/851-PR-other-56780.patch
diff --git a/package/gcc/arc-2014.12/910-gcc-poison-system-directories.patch b/package/gcc/arc-2015.06-rc1/910-gcc-poison-system-directories.patch
similarity index 100%
rename from package/gcc/arc-2014.12/910-gcc-poison-system-directories.patch
rename to package/gcc/arc-2015.06-rc1/910-gcc-poison-system-directories.patch
-- 
2.4.3
