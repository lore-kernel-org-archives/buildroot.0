From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Oct 2014 10:35:48 +0200
Subject: [Buildroot] [PATCH v2 1/1] Add new package: biosdevname
In-Reply-To: <0F64ADC7-47A8-4E72-90E7-2F5A9E0F32B8@deadfrog.net>
References: <0F64ADC7-47A8-4E72-90E7-2F5A9E0F32B8@deadfrog.net>
Message-ID: <20141012083548.GA3870@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2014-02-03 16:37 -0500, Ryan Wilkins spake thusly:
> Signed-off-by: Ryan Wilkins <ryan@deadfrog.net>
> ---
> v2: incorporated comments from Arnout

I've sent an updated version of that patch:
    http://patchwork.ozlabs.org/patch/398911/

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                  |    1 +
>  package/biosdevname/Config.in      |   13 +++++++++++++
>  package/biosdevname/biosdevname.mk |   15 +++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 package/biosdevname/Config.in
>  create mode 100644 package/biosdevname/biosdevname.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 93d23cb..d2aeab8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -265,6 +265,7 @@ endmenu
>  source "package/a10disp/Config.in"
>  source "package/acpid/Config.in"
>  source "package/avrdude/Config.in"
> +source "package/biosdevname/Config.in"
>  source "package/cdrkit/Config.in"
>  source "package/cryptsetup/Config.in"
>  source "package/cwiid/Config.in"
> diff --git a/package/biosdevname/Config.in b/package/biosdevname/Config.in
> new file mode 100644
> index 0000000..17a9aa4
> --- /dev/null
> +++ b/package/biosdevname/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_BIOSDEVNAME
> +	bool "biosdevname"
> +	depends on (BR2_i386 || BR2_x86_64) && BR2_PACKAGE_UDEV
> +	select BR2_PACKAGE_PCIUTILS
> +	help
> +	  Biosdevname is a udev helper that looks at various BIOS tables to
> +	  figure out what the actual hardware names are for Ethernet ports
> +	  and renames the ports accordingly.  This has the advantage of
> +	  always referring to the same port regardless of system or
> +	  hardware changes that might otherwise alter the typical ethX
> +	  naming.
> +
> +	  http://linux.dell.com/biosdevname/
> diff --git a/package/biosdevname/biosdevname.mk b/package/biosdevname/biosdevname.mk
> new file mode 100644
> index 0000000..be1c6af
> --- /dev/null
> +++ b/package/biosdevname/biosdevname.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# biosdevname
> +#
> +################################################################################
> +
> +BIOSDEVNAME_VERSION = 0.4.1
> +BIOSDEVNAME_SITE = http://linux.dell.com/biosdevname/biosdevname-$(BIOSDEVNAME_VERSION)
> +BIOSDEVNAME_LICENSE = GPL
> +BIOSDEVNAME_LICENSE_FILES = COPYING
> +BIOSDEVNAME_INSTALL_TARGET = YES
> +BIOSDEVNAME_CONF_OPT = --exec-prefix=/
> +BIOSDEVNAME_DEPENDENCIES = pciutils
> +
> +$(eval $(autotools-package))
> -- 
> 1.7.9.5
> 

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
