From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 21:35:50 +0200
Subject: [Buildroot] [PATCH] boot/uboot: default to kconfig buildsystem
 for latest version
In-Reply-To: <20180424163410.16587-1-yann.morin.1998@free.fr>
References: <20180424163410.16587-1-yann.morin.1998@free.fr>
Message-ID: <20180425213550.361af846@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Apr 2018 18:34:10 +0200, Yann E. MORIN wrote:
> By default, the builsystem for uboot defaults to 'legacy', while the
> default version is very well capable of using the 'kconfig' buildsystem
> instead.
> 
> Having the 'legacy' buildsystem be the default in that case makes it
> quite inconvenient for users: they would expect to be able to use e.g.
> uboot-menuconfig et al. with the default uboot version.
> 
> Switch to using 'kconfig' when we use the latest version. Keep the
> 'legacy' as default for everything else.
> 
> Also, invert the 'legacy' and 'kconfig' entries in the choice: it is
> nicer to have the recent and future-proodf entry first.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  boot/uboot/Config.in | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
