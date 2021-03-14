From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:32:31 +0100
Subject: [Buildroot] [PATCH] package/libgeos: disable package if
 binutils is affected from bug 21464
In-Reply-To: <20210307175214.3980194-1-giulio.benetti@benettiengineering.com>
References: <20210307175214.3980194-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210314233231.351fce1c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Mar 2021 18:52:14 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This package is affected from binutils bug 21464, since there is no
> workaround, let's disable it.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3eb/3eb9f9d0f6d8274b2d19753c006bd83f7d536e3c/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> This patch must be applied after this patchset:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=232409
> ---
>  package/libgeos/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I've applied. However, it's a bit inconsistent that we fixed this for
OpenRISC with a proper BR2_TOOLCHAIN_HAS_BINUTILS_BUG_xyz, but for
NIOS2 it is globally disabled for BR2_nios2.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
