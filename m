From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 7 Feb 2014 23:20:28 +0100
Subject: [Buildroot] [PATCH 3/4] samba: convert to choice package
In-Reply-To: <1391806354-32698-4-git-send-email-gustavo@zacarias.com.ar>
References: <1391806354-32698-1-git-send-email-gustavo@zacarias.com.ar>
 <1391806354-32698-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAHXCMMJWZ_9zuR0npRzv=uE2nVdUAGZ7uF3vv7B6rBvmQo7PyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Fri, Feb 7, 2014 at 9:52 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:

[...]

> diff --git a/package/samba/Config.in b/package/samba/Config.in
> index 1469075..d11401f 100644
> --- a/package/samba/Config.in
> +++ b/package/samba/Config.in
> @@ -1,270 +1,32 @@
> +comment "samba needs a toolchain w/ threads"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
>  config BR2_PACKAGE_SAMBA
>         bool "samba"
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on BR2_USE_MMU # fork()
> -       select BR2_PACKAGE_POPT
>         help
> -         Provides print services to all manner of SMB/CIFS clients,
> -         including the numerous versions of Microsoft Windows
> -         operating systems.
> -
> -         http://www.samba.org/
> -
> -         NOTE: A complete Samba install takes over 50MB of space,
> -               so choose only the components you need.
> -
> -comment "samba needs a toolchain w/ threads"
> -       depends on BR2_USE_MMU
> -       depends on !BR2_TOOLCHAIN_HAS_THREADS
> +         Provides secure, stable and fast file and print services
> +         for all clients using the SMB/CIFS protocol, such as all versions
> +         of DOS and Windows, OS/2, Linux and many others.
>
>  if BR2_PACKAGE_SAMBA
>

[...]

> +choice
> +       prompt "Samba version"
> +       default BR2_PACKAGE_SAMBA3
>         help
> -         Tool for executing client side MS-RPC functions using RPC
> -         calls from a UNIX workstation.
> +         Select the desired samba version.
>

[...]

> +       config BR2_PACKAGE_SAMBA3
> +       bool "3.6.x"

Indentation is weird here, no?

> +       select BR2_PACKAGE_POPT
>         help
> -         Include support for gamin
> +         The well-tested legacy branch.
>
> -comment "support gamin - disabled (requires gamin)"
> -       depends on !BR2_PACKAGE_GAMIN
> -
> -endmenu
> +endchoice
>
>  endif


Regards,


-- 
Samuel
