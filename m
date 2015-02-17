From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 17 Feb 2015 16:29:31 +0100
Subject: [Buildroot] [PATCHv2 for next 0/2] Add support for Cavium Octeon III
Message-ID: <1424186973-7838-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This series adds support for building for the Cavium Octeon III processor,
using the Cavium Networks SDK. The specific thing about this toolchain is
that the libraries for the hardware-floating point capable processors are in
lib32-fp and lib64-fp, rather than lib32/lib64.

The first patch was submitted earlier, and is resent with updated commit
message.

v2: fix some minor issues in the second patch (see patch description)

Bai Yingjie (1):
  toolchain-external: improve lib subdirectory matching

Thomas De Schampheleire (1):
  toolchain: create symlink to 'lib' from ARCH_LIB_DIR iso fixed
    lib32/lib64

 Makefile                                             | 14 +-------------
 toolchain/helpers.mk                                 | 16 ++++++++++++++++
 toolchain/toolchain-buildroot/toolchain-buildroot.mk | 11 +++++++++++
 toolchain/toolchain-external/toolchain-external.mk   | 16 ++++++++++++++--
 4 files changed, 42 insertions(+), 15 deletions(-)

-- 
1.8.5.1
