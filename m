From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 08:52:02 +0200
Subject: [Buildroot] [git commit branch/next] binutils: remove support for
	version 2.23
Message-ID: <20160517065436.05F8A81ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae466a6041d06ac969694376d1bc3dec5ea517af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that we have added support for the lastest binutils version 2.26,
it is time to remove the oldest version we currently support, 2.23, in
order to keep only 3 versions: 2.24, 2.25 and 2.26.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |  13 +-
 package/binutils/2.23.2/120-sh-conf.patch          |  29 -
 .../2.23.2/300-001_ld_makefile_patch.patch         |  24 -
 .../2.23.2/300-012_check_ldrunpath_length.patch    |  21 -
 package/binutils/2.23.2/500-sysroot.patch          |  37 -
 .../2.23.2/600-poison-system-directories.patch     | 279 -------
 .../binutils/2.23.2/900-xtensa-trampolines.patch   | 846 ---------------------
 .../901-xtensa-gas-first-frag-alignment.patch      |  51 --
 .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 ----
 ...ix-ld-segfault-when-linking-linux-modules.patch |  47 --
 ...-target-out-of-range-xtensa-ld-relaxation.patch |  79 --
 ...ines-search-code-for-conditional-branches.patch |  90 ---
 ...localized-symbol-refcounting-with-gc-sect.patch |  57 --
 ...x-gas-segfault-with-text-section-literals.patch |  56 --
 ...-xtensa-fix-signedness-of-gas-relocations.patch |  47 --
 ...15-xtensa-fix-.init-.fini-literals-moving.patch |  70 --
 package/binutils/Config.in.host                    |  10 -
 package/binutils/binutils.hash                     |   1 -
 18 files changed, 9 insertions(+), 1881 deletions(-)

Patch is too large, so refusing to show it
