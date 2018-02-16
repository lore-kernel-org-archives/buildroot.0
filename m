From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri, 16 Feb 2018 09:36:02 +0100
Subject: [Buildroot] [PATCH 0/4]  llvm for mesa3d
Message-ID: <20180216083606.6472-1-valentin.korenblit@smile.fr>
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

Regards,

Valent?n

Romain Naour (4):
  package/llvm: new host package
  package/llvm: enable target variant
  package/llvm: add AMDGPU support
  package/mesa3d: enable llvm support

 package/Config.in           |   1 +
 package/Config.in.host      |   1 +
 package/llvm/Config.in      |  38 +++++
 package/llvm/Config.in.host |   8 +
 package/llvm/llvm.hash      |   2 +
 package/llvm/llvm.mk        | 356 ++++++++++++++++++++++++++++++++++++++++++++
 package/mesa3d/Config.in    |   8 +
 package/mesa3d/mesa3d.mk    |  18 ++-
 8 files changed, 429 insertions(+), 3 deletions(-)
 create mode 100644 package/llvm/Config.in
 create mode 100644 package/llvm/Config.in.host
 create mode 100644 package/llvm/llvm.hash
 create mode 100644 package/llvm/llvm.mk

-- 
2.14.3
