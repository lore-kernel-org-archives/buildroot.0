From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 14:30:54 +0200
Subject: [Buildroot] [PATCH] musl: allow to build ppc64 toolchains
In-Reply-To: <20160818063728.GA28662@waldemar-brodkorb.de>
References: <20160818063728.GA28662@waldemar-brodkorb.de>
Message-ID: <20160819143054.5c36ee3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 08:37:29 +0200, Waldemar Brodkorb wrote:
> Latest musl release supports ppc64 architecture.
> Tested with Qemu for big endian and little endian configurations.
> Musl implements ELFv2 ABI. Only gcc 6.x contains required
> changes for musl ppc64 support.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/gcc/Config.in.host              | 8 ++++++++
>  package/gcc/gcc.mk                      | 6 ++++++
>  toolchain/toolchain-buildroot/Config.in | 2 +-
>  3 files changed, 15 insertions(+), 1 deletion(-)

Applied to next, with some minor tweaks (reworked commit log + addition
of a comment in gcc.mk to explain why we are forcing the ABI).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
