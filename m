From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 28 Oct 2014 22:28:16 +0100
Subject: [Buildroot] [PATCH v2 0/3] toolchain: Add support for Sourcery
	Codebench Standard
Message-ID: <1414531699-6789-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The purpose of this series is to provide support for Sourcery Codebench
Standard (licenced) edition in Buildroot.

Since these toolchain can't be downloaded, we need to use the custom toolchain
backend to import them into Buildroot.

In Toolchain menu, select:
  Toolchain type (External toolchain)
  Toolchain (Custom toolchain)
  Toolchain origin (Pre-installed toolchain)

Then set all toolchain settings (kernel headers, libc, rpc, c++ etc...)

I'm using the Sourcery Codebench 2014.05 for IA32 GNU/Linux, here is the
settings:

(i686-pc-linux-gnu) Toolchain prefix
  External toolchain kernel headers series (3.13.x)
  External toolchain C library (glibc/eglibc)
[*] Toolchain has RPC support
[*] Toolchain has C++ support?
(-pipe -msgxx-glibc) Target Optimizations

The "-msgxx-glibc" flag in "Target Optimizations" is mandatory otherwise the
toolchain won't work.

Thanks to Yann E. Morin and Thomas Petazzoni for the help and review on this topic.

v2: Rework entirely this serie to take into account comments received on v1.
http://lists.busybox.net/pipermail/buildroot/2014-October/108641.html

Romain Naour (3):
  toolchain-external: Detect empty or invalid sysroot
  toolchain-helpers: factorise the arch sysroot symlink creation
  toolchain-external: calculation of the symlink to the arch sysroot

 toolchain/helpers.mk                               | 70 +++++++++++++++++++---
 toolchain/toolchain-external/toolchain-external.mk | 28 ++++++---
 2 files changed, 82 insertions(+), 16 deletions(-)

-- 
1.9.3
