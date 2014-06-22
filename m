From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:02:35 +0200
Subject: [Buildroot] [PATCH 1/4] legal-info: extract even
 no-redistribute packages
In-Reply-To: <a7e86f7ce80cc74bf84a77bcd1faee3acd2e04b6.1403439879.git.yann.morin.1998@free.fr>
References: <cover.1403439879.git.yann.morin.1998@free.fr>
 <a7e86f7ce80cc74bf84a77bcd1faee3acd2e04b6.1403439879.git.yann.morin.1998@free.fr>
Message-ID: <20140622220235.2da1f822@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 22 Jun 2014 14:41:12 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, if a package is marked _REDISTRIBUTE = NO, then legal-info
> will not try to extract it first.
> 
> If that package also declares some _LICENSE_FILES, legal-info fails
> if it is the only action we're trying to run:
> 
>     $ cat defconfig
>     BR2_arm=y
>     BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
>     BR2_PACKAGE_LIBFSLCODEC=y
>     $ make BR2_DEFCONFIG=$(pwd)/defconfig defconfig
>     $ make legal-info
>     [--SNIP--]
>     cat: /home/ymorin/dev/buildroot/O/build/libfslcodec-3.5.7-1.0.0/EULA: No such file or directory
> 
> Fix this by always having legal-info extract the archives if one or
> more _LICENSE_FILES are specified.
> 
> We do this for all types of packages: overridden, local or 'normal'
> remote packages. Even though we do not save the sources for the
> overridden or local packages, we need to save their licensing info,
> so we need to extract them.
> 
> This implies that we now need only PKG-source, not PKG-extract anymore,
> as a dependency of legal-info for packages we want to save (ie.
> redistributable, non-local and non-overriden packages.)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
