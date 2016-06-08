From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 00:01:54 +0200
Subject: [Buildroot] [PATCH 1/1] binutils: enable as target package for
 aarch64
In-Reply-To: <20160529033335.8886-1-nunes.erico@gmail.com>
References: <20160529033335.8886-1-nunes.erico@gmail.com>
Message-ID: <20160609000154.25eab998@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 May 2016 00:33:35 -0300, Erico Nunes wrote:
> binutils got disabled as a target package for aarch64 back in Buildroot
> 2012.11 (commit 660d16f4).
> The default version 2.21.1 at the time didn't really support aarch64, as
> shown by the autobuilder error reference in that commit.
> 
> binutils has now had support for aarch64 since 2.23, but was never
> re-enabled for aarch64.
> 
> All of the binutils versions currently supported by Buildroot (oldest
> being 2.24) support aarch64, so we can now enable it without any
> restrictions.
> 
> This same patch also touches the dropwatch, lightning and oprofile
> packages which all select binutils and had the 'depends on !aarch64' to
> keep Kconfig consistent. They are now re-enabled for aarch64 as well.
> They are changed in this same patch so that Kconfig is kept consistent
> and doesn't end up having them disabled in a commit which only has the
> binutils change applied.
> lightning has other explicit arch dependencies so it is not actually yet
> available in aarch64, but at least the dependency on !aarch64 because of
> binutils is not needed anymore.
> 
> Everything has been build tested with Buildroot and external toolchains.
> binutils and dropwatch work fine in a qemu target. oprofile doesn't seem
> to be supported in the qemu aarch64 processor but builds fine and seems
> to have some level of aarch64 support in the source, so there doesn't
> seem to be a reason to keep it disabled in Kconfig.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  package/binutils/Config.in  | 4 ++--
>  package/dropwatch/Config.in | 4 ++--
>  package/lightning/Config.in | 4 ++--
>  package/oprofile/Config.in  | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
