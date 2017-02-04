From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat,  4 Feb 2017 14:42:04 +0100
Subject: [Buildroot] [PATCHv2 00/10] toolchain: improvements to
	copy_toolchain_sysroot and copy_toolchain_lib_root
Message-ID: <20170204134214.20592-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Hi,

This toolchain patch series started out to fix the handling of the Cavium Octeon
2 toolchain (see patch "cover multilib toolchains with lib/<variant>/layout")
but along the way I fixed/improved a few other things.
Details are found in the commit messages of these patches.

I tested a number of external toolchains and arches available in Buildroot, as
well as the Octeon SDK toolchain.  I think I understand the situation
sufficiently well to get some confidence, but this is the type of
change that is difficult to get 100% certainty about.

Best regards,
Thomas

v2:
- fix broken symlinks in patch "cover multilib toolchains ..."
- simplification of fixed broken symlinks
- improvements in copy_toolchain_lib_root

Thomas De Schampheleire (10):
  toolchain-external: clarify rsync excludes in copy_toolchain_sysroot
  toolchain-external: handle ld.so fixups centrally
  toolchain helpers: introduce function relpath_prefix
  toolchain-external: cover multilib toolchains with lib/<variant>
    layout
  toolchain helpers: introduce simplify_symlink
  toolchain-external: simplify previously-broken symbolic links
  toolchain: copy_toolchain_lib_root: remove unused variable LIBDIR
  toolchain: copy_toolchain_lib_root: clarify logic
  toolchain: copy_toolchain_lib_root: clarify input parameter
  toolchain: copy_toolchain_lib_root: copy symlinks instead of
    recreating them

 package/glibc/glibc.mk                             |   4 +-
 toolchain/helpers.mk                               | 126 +++++++++++++++++----
 .../toolchain-external/pkg-toolchain-external.mk   |  14 ++-
 .../toolchain-external-codesourcery-aarch64.mk     |  10 --
 4 files changed, 114 insertions(+), 40 deletions(-)

-- 
2.10.2
