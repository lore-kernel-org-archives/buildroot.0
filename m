From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:33:13 +0200
Subject: [Buildroot] [PATCH v8 07/14] toolchain: add post-install hooks
 making the toolchain relocatable
In-Reply-To: <1460929111-15615-8-git-send-email-s.martin49@gmail.com>
References: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
 <1460929111-15615-8-git-send-email-s.martin49@gmail.com>
Message-ID: <20160418213313.6c5a3d21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 23:38:24 +0200, Samuel Martin wrote:
> This change adds the required dependency and post-target-install hooks
> to render the toolchain relocatable.
> 
> Notes:
> - Although the toolchain package is a virtual package, it does support
>   hooks.
> - This has to be post-target-install hooks because the toolchain package
>   is handled as a "target" package.
> 
> Ultimately, this patch allows to generate relocatable toolchains, just
> by doing:
> 
>   $ make menuconfig
>   $ make toolchain
> 
> Then, this toolchain can be used/shared/deployed anywhere*.
> 
> *: on any Linux system with an ABI-compatible set of system libraries
>    (usually including: glibc, libgcc, zlib, flex and libsigsegv).
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Why is this needed? You already do such steps in the
TARGET_FINALIZE_HOOKS ?

Yes, it means after just a "make toolchain", you don't have a
relocatable toolchain. But Buildroot never guaranteed that a partial
build will yield fully  usable results.

So I would prefer to not have this patch, at least in the initial
version of the series.

Again, this stuff is complicated. Please keep things as minimal as
possible in a first step.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
