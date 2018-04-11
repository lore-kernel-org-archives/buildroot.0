From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Apr 2018 09:08:15 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: Add Freedreno gallium driver
In-Reply-To: <CAEj2-1MdHRREFJKrkMjc9U2j_x1mJjOwkeqaV_d1iLejM4q3hg@mail.gmail.com>
References: <CAEj2-1MdHRREFJKrkMjc9U2j_x1mJjOwkeqaV_d1iLejM4q3hg@mail.gmail.com>
Message-ID: <20180411090815.447db2ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andre,

Thanks for your contribution. Could you resend your patch with git
send-email ? You sent it with your e-mail client, and therefore it has
been line-wrapped, which makes it unapplicable.

On Wed, 11 Apr 2018 04:41:27 +0000, Andre Renaud wrote:
> Added option to enable Freedreno gallium driver in mesa3d
> 
> Signed-off-by: Andre Renaud <andre@ignavus.net>
> ---
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index f141587c4d..3d99637cc3 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -63,6 +63,13 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
>         help
>           Mesa driver for Vivante GPUs.
> 
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
> +       bool "Gallium freedreno driver"
> +       select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +       select BR2_PACKAGE_LIBDRM_FREEDRENO
> +       help
> +         Mesa driver for Freedreno GPUs.

Please use tabs for indentation of bool/select/help, and one tab + 2
spaces for the help text. You can run ./utils/check-package on the
files you are changing to do some minimal validation of the coding
style.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
