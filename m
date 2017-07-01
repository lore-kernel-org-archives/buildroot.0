From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 1 Jul 2017 14:52:55 +0200
Subject: [Buildroot] [PATCH 0/2] Adding LLVM + support for it in Mesa3D
In-Reply-To: <20170616204143.29198-1-aperez@igalia.com>
References: <20170616204143.29198-1-aperez@igalia.com>
Message-ID: <8fd3c501-3f34-c079-d080-15e8b71df359@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adrian,

Le 16/06/2017 ? 22:41, Adrian Perez de Castro a ?crit :
> Hello everybody,
> 
> This set of patches adds an LLVM package. For now my main motivation is to
> enable support for llvmpipe in Mesa3D'd swrast Gallium driver, which we I am
> using in am embedded ARM device which does not provide a GPU, and software
> rendering is enough for a small 320x240 LCD framebuffer -- so that is tested
> and working.
> 
> So far the built LLVM enables only the code generation backend for the CPU of
> the target device, which fits the Mesa3D use-case. Having a llvm package in
> Buildroot is interesting for many reasons, and I see this as a first step, on
> top of which to build on later: target packages for new programming languages
> using Clang+LLVM as cross-toolchain, or enabling building programs written in
> Rust are just a few examples.
> 
> I'll be happy to iterate on these patches with your feedback (keep me CC'd,
> please), and have them upstream.

Thanks for this work!

I also tried to add llvm and clang in Buildroot but it's not finished yet.
See [1].
I successfully tested llvmpipe with a HD6310 graphic card and I also try to
enable libclc support (openCL).

I'll take a look at your patches and try to improve the llvm packaging.
First, I'll rebase the work on the latest llvm release 4.0.1.

Best regards,
Romain

[1] https://github.com/RomainNaour/buildroot/tree/clang-llvm-v4.0.0

> 
> Best regards,
> 
> --
>  Adri?n ?
> 
> Adrian Perez de Castro (2):
>   llvm: new package
>   mesa3d: Allow optionally using LLVM in drivers
> 
>  package/Config.in                                  |   1 +
>  ...-Clean-up-exported-values-update-for-shar.patch |  57 ++++++++
>  package/llvm/Config.in                             |  48 +++++++
>  package/llvm/llvm.hash                             |   2 +
>  package/llvm/llvm.mk                               | 145 +++++++++++++++++++++
>  package/mesa3d/Config.in                           |  11 ++
>  package/mesa3d/mesa3d.mk                           |   9 +-
>  7 files changed, 272 insertions(+), 1 deletion(-)
>  create mode 100644 package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
>  create mode 100644 package/llvm/Config.in
>  create mode 100644 package/llvm/llvm.hash
>  create mode 100644 package/llvm/llvm.mk
> 
