From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 13:51:40 +0200
Subject: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: use
 tested bootloader version
In-Reply-To: <2bc574ee-4d0e-ce24-dcdd-ad1c3d50e9c2@grenoble.cnrs.fr>
References: <2bc574ee-4d0e-ce24-dcdd-ad1c3d50e9c2@grenoble.cnrs.fr>
Message-ID: <20210520115140.GA2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Edgar, All,

On 2021-05-19 21:43 +0200, Edgar Bonet spake thusly:
> The new branch "4.x" of at91bootstrap has dropped the contrib directory,
> which holds the defconfigs used by the Acmesystems Acqua A5 boards. We
> then cannot use the latest at91bootstrap anymore.

Note that the support for the 4.x branch has only landed in the 'next'
branch so far; master is still not affected by this change.

But your patch was mad against master, not next, so it does not apply
cleanly on next. Indeed, on next, the two acqua_a5 defconfigs have been
fixed to use BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y so they are
still using at91bootstrap 3.x (3.10.2 as of today).

> As commit e009816c67fc1335a9b2da8687b55c5ff6aa27cf introduced support
> for at91bootstrap 4.x in the "next" branch, it had to work around this
> by pinning these defconfigs to the "latest 3.x" version.
> 
> Avoid this and any future incompatibility problems by explicitly
> requesting a tested version of at91bootstrap.

The other acmesystem defconfigs are using a "custom git" setting, so
I've done the same for the two acqua defconfigs.

> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to next, with the changes explained above, thanks.

I considered applying to master, but there is no issue on master, and
that would have caused a merge conflict when we were going to merge
next back into master...

Regards,
Yann E. MORIN.

> ---
>  configs/acmesystems_acqua_a5_256mb_defconfig | 2 ++
>  configs/acmesystems_acqua_a5_512mb_defconfig | 2 ++
>  2 files changed, 4 insertions(+)
> 
> Note: I made the patch against master, hopping it's the right branch. I
> realize this will cause a conflict when "next" will be merged into
> master. Should I submit the patch against next instead?
> 
> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
> index 810c3c9782..6c4d1e5b50 100644
> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
> @@ -17,6 +17,8 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_AT91BOOTSTRAP3=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.2)/at91bootstrap-v3.10.2.tar.gz"
>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
> index 11a7e795e0..96989382ff 100644
> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
> @@ -17,6 +17,8 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_AT91BOOTSTRAP3=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.2)/at91bootstrap-v3.10.2.tar.gz"
>  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> -- 
> 2.25.1
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
