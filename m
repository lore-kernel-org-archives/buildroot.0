From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 22:28:21 +0200
Subject: [Buildroot] [git commit] binutils: remove support for binutils 2.25
Message-ID: <20170403203031.40DC882574@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5847291b6c0dcacc0857ba29d3471a981e5e87d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have switched to binutils 2.27 as the default binutils
version, it's time to get rid of binutils 2.25. So this commit remove
the 2.25 version choice, the hash file entry, the patches, and adds a
Config.in.legacy option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |   8 +
 package/binutils/2.25.1/120-sh-conf.patch          |  29 -
 .../2.25.1/300-001_ld_makefile_patch.patch         |  24 -
 .../2.25.1/300-012_check_ldrunpath_length.patch    |  21 -
 package/binutils/2.25.1/500-sysroot.patch          |  37 -
 .../2.25.1/600-poison-system-directories.patch     | 276 -------
 package/binutils/2.25.1/800-microblaze-musl.patch  |  22 -
 ...ines-search-code-for-conditional-branches.patch |  90 ---
 ...nsa-optimize-check_section_ebb_pcrels_fit.patch | 502 -------------
 .../907-xtensa-optimize-removed_by_actions.patch   | 356 ---------
 .../908-xtensa-optimize-find_removed_literal.patch | 146 ----
 ...tensa-replace-action-list-with-splay-tree.patch | 826 ---------------------
 ...10-xtensa-optimize-trampolines-relaxation.patch | 345 ---------
 ...localized-symbol-refcounting-with-gc-sect.patch |  57 --
 ...x-gas-segfault-with-text-section-literals.patch |  56 --
 .../913-xtensa-add-auto-litpools-option.patch      | 699 -----------------
 ...-xtensa-fix-signedness-of-gas-relocations.patch |  99 ---
 ...ertion-in-NIOS2-linker-to-allow-signed-16.patch |  70 --
 ...15-xtensa-fix-.init-.fini-literals-moving.patch | 149 ----
 .../binutils/2.25.1/916-microblaze-pr21180.patch   |  33 -
 package/binutils/Config.in.host                    |   6 -
 package/binutils/binutils.hash                     |   1 -
 22 files changed, 8 insertions(+), 3844 deletions(-)

Patch is too large, so refusing to show it
