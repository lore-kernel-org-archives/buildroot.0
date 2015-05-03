From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 May 2015 16:31:52 +0200
Subject: [Buildroot] [PATCH v3] sh4: fix toolchain creation
In-Reply-To: <20150408085455.GA26812@waldemar-brodkorb.de>
References: <20150408085455.GA26812@waldemar-brodkorb.de>
Message-ID: <20150503163152.68499cac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 8 Apr 2015 10:54:55 +0200, Waldemar Brodkorb wrote:
> The Linux kernel does force compile with -m4-nofpu, which is only
> available when building a multilib toolchain.
> The interesting part here is, that buildroot use --disable-multilib for
> gcc configure, but enables --with-multilib-list=m4,m4-nofpu in
> the default configuration for Qemu targeting r2d emulation.
> This results in a toolchain, which can be used for the kernel and
> for userland without creating a multilib toolchain with different
> kinds of libgcc version. In the multilib case there would be
> subdirectories created (!m4 and m4-nofpu). As buildroot uses a
> short version of toolchain creation, a multilib enabled gcc build
> fails when creating libgcc.
> 
> So the best solution is to just keep multilib disabled, but always
> add --with-multilib-list when sh4/sh4eb/sh4a/sh4aeb is choosen.
> 
> Tested with sh4/sh4a toolchain build and qemu defconfig with
> gcc 4.8.x/4.9.x (with and without C++ enabled), uClibc and glibc.
> 
> Disable sh4a/sh4aeb for uClibc, as it does not implemented, yet.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> Changes v3:
>  - add local variable for complete directory as suggested by Thomas Pettazoni
>  - disable sh4a/sh4aeb for uClibc as suggested by Thomas Pettazoni

Applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
