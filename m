From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Aug 2020 20:53:23 +0200
Subject: [Buildroot] [PATCH v2 00/12] Add the support for Clang
 cross-compiler
In-Reply-To: <20190907094027.9537-1-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
Message-ID: <6b09950c-b36e-fdab-ff93-503445e7cddb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Romain,

 After almost a year, let's try to make some progress on this series :-)

On 07/09/2019 11:40, Romain Naour wrote:
[snip]
> Recently, I've tried to build an aarch64 Linux kernel (5.2.7) with
> Clang and it worked under Qemu [3]. I also tested for x86_64 but we need
> the upcomming llvm/clang version 9 to build the kernel [4].

 Since we waited long enough, this is now in Buildroot :-)

> This new version add the support of "asm-goto" which was the last
> missing part to be able to build the Linux kernel on x86_64 [5].
> But for theses tests, only the kernel was built with Clang.
> 
> While testing the x86_64 kernel and it's rootfs built with Clang under Qemu,
> I had a runtime issue during the userspace boot process (Busybox's init).
> While searching about the issue, I discover the lowRISC blog from Lu?s Marques
> about the same issue and tested the patch he contributed to the Busybox project
> (Thanks!).
> 
> So, this series is about to complete the integration of Clang as cross-compiler
> by using a toolchain-wrapper and fixing some build system infrastructure
> (cmake, meson) to use Clang instead of GCC.

 I started integrating the series, but then I had some fundamental problems with
the core patch itself. So I stopped and pushed my results to
https://gitlab.com/arnout/buildroot branch clang-as-cross-compiler. I put my
changes as squash patches rather than changing the original patches, so you can
easily take over from there. Note that I haven't tested my rebased and modified
branch (just a build test immediately after applying the modified patch), so
there may still be some rebase f**up there.

 I'll put my feedback in the individual patches.

 Regards,
 Arnout

> 
> Add this new experimental option into "Advanced" menu since we are expecting
> some build and runtime issues for number of packages (bootloaders, kernel).
> 
> For now, Clang cross-compiler can only be use as internal toolchain,
> so it is build from the source which take a long time...
[snip]
