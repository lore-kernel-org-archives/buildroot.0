From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 31 Jan 2017 17:03:37 +0100
Subject: [Buildroot] [PATCH 0/6] toolchain-external: copy_toolchain_sysroot
	improvements
Message-ID: <20170131160343.27144-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Hi,

This toolchain patch series started out to fix the handling of the Cavium Octeon
2 toolchain (last patch) but along the way I fixed a few other things.
Details are found in the commit messages of these patches.

I tested a number of external toolchains and arches available in Buildroot, as
well as the Octeon SDK toolchain.  I think I understand the situation
sufficiently well to get some confidence, but this is the type of
change that is difficult to get 100% certainty about.

Best regards,
Thomas

Thomas De Schampheleire (6):
  toolchain-external: remove stale references to (ARCH_)LIBC_A_LOCATION
  toolchain helpers: clarify rsync excludes in copy_toolchain_sysroot
  toolchain-external: handle ld.so fixups centrally
  toolchain helpers: introduce function relpath_prefix
  toolchain-external: cover multilib toolchains with lib/<variant>
    layout
  DEVELOPERS: update Thomas De Schampheleire

 DEVELOPERS                                         |  9 ++--
 toolchain/helpers.mk                               | 63 +++++++++++++++++-----
 .../toolchain-external/pkg-toolchain-external.mk   | 40 +++++++-------
 .../toolchain-external-codesourcery-aarch64.mk     | 10 ----
 4 files changed, 73 insertions(+), 49 deletions(-)

-- 
2.10.2
