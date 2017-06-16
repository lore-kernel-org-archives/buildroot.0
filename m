From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 16 Jun 2017 23:41:41 +0300
Subject: [Buildroot] [PATCH 0/2] Adding LLVM + support for it in Mesa3D
Message-ID: <20170616204143.29198-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

This set of patches adds an LLVM package. For now my main motivation is to
enable support for llvmpipe in Mesa3D'd swrast Gallium driver, which we I am
using in am embedded ARM device which does not provide a GPU, and software
rendering is enough for a small 320x240 LCD framebuffer -- so that is tested
and working.

So far the built LLVM enables only the code generation backend for the CPU of
the target device, which fits the Mesa3D use-case. Having a llvm package in
Buildroot is interesting for many reasons, and I see this as a first step, on
top of which to build on later: target packages for new programming languages
using Clang+LLVM as cross-toolchain, or enabling building programs written in
Rust are just a few examples.

I'll be happy to iterate on these patches with your feedback (keep me CC'd,
please), and have them upstream.

Best regards,

--
 Adri?n ?

Adrian Perez de Castro (2):
  llvm: new package
  mesa3d: Allow optionally using LLVM in drivers

 package/Config.in                                  |   1 +
 ...-Clean-up-exported-values-update-for-shar.patch |  57 ++++++++
 package/llvm/Config.in                             |  48 +++++++
 package/llvm/llvm.hash                             |   2 +
 package/llvm/llvm.mk                               | 145 +++++++++++++++++++++
 package/mesa3d/Config.in                           |  11 ++
 package/mesa3d/mesa3d.mk                           |   9 +-
 7 files changed, 272 insertions(+), 1 deletion(-)
 create mode 100644 package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
 create mode 100644 package/llvm/Config.in
 create mode 100644 package/llvm/llvm.hash
 create mode 100644 package/llvm/llvm.mk

-- 
2.13.1
