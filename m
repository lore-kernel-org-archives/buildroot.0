From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Mon, 19 Feb 2018 18:18:02 +0100
Subject: [Buildroot] [PATCH v2 0/3]  llvm for mesa3d
Message-ID: <20180219171805.13769-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

This series provides LLVM support for Mesa3d, enabling
llvmpipe software rasterizer.

It must be considered that it does not provide a full LLVM
installation for the host, only the necessary components to
cross-compile LLVM for the target. It will install all target
components as libLLVM.so.

Changes in v2:

The series has been simplified:

*Build only backend for target architecture by default.

*Support for AMDGPU(PATCH 3/4 in v1) was removed because I cannot test
it currently. 

*Host: make options modified to build only llvm-config and llvm-tblgen
(reduces drastically build time for host).

*Target: support only x86 currently (tested), I will test on ARM soon.


The idea is to add incrementally more options to configure LLVM as soon
as I can test them.
 
Regards,

Valent?n


Romain Naour (3):
  package/llvm: new host package
  package/llvm: enable target variant
  package/mesa3d: enable llvm support

 package/Config.in           |   1 +
 package/Config.in.host      |   1 +
 package/llvm/Config.in      |  19 +++
 package/llvm/Config.in.host |   8 +
 package/llvm/llvm.hash      |   2 +
 package/llvm/llvm.mk        | 360 ++++++++++++++++++++++++++++++++++++++++++++
 package/mesa3d/Config.in    |   8 +
 package/mesa3d/mesa3d.mk    |  18 ++-
 8 files changed, 414 insertions(+), 3 deletions(-)
 create mode 100644 package/llvm/Config.in
 create mode 100644 package/llvm/Config.in.host
 create mode 100644 package/llvm/llvm.hash
 create mode 100644 package/llvm/llvm.mk

-- 
2.14.3
