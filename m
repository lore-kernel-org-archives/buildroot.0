From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 19:52:49 +0200
Subject: [Buildroot] [PATCH 1/1] core/pkg-kconfig: pass host
 PKG_CONFIG_PATH env var
In-Reply-To: <1464386608-13165-1-git-send-email-bjorn.forsman@gmail.com>
References: <1464386608-13165-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20160528195249.256cd78d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 00:03:28 +0200, Bj?rn Forsman wrote:
> This is basically the same change as in 0515fe45661b6d320f8d2071df2
> ("Makefile: pass host PKG_CONFIG_PATH at "make menuconfig" time"). That
> commit made sure to pass host PKG_CONFIG_PATH when invoking Buildroot's
> own menuconfig program. This change ensures that the same is true for
> third party menuconfig programs (i.e. Linux, uClibc and Busybox).
> 
> This unbreaks "make {linux,uclibc}-menuconfig" for host platforms which
> rely on PKG_CONFIG_PATH to find .pc files (e.g. NixOS). (When Busybox
> updates to a more recent Kconfig snapshot, one that uses pkg-config to
> find ncurses, "make busybox-menuconfig" will also start working.)
> 
> Tested on Ubuntu and NixOS:
> 
>   $ make qemu_arm_versatile_defconfig
>   $ make linux-menuconfig
>   $ make
> 
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
>  package/pkg-kconfig.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
