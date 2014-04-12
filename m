From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 17:12:55 +0200
Subject: [Buildroot] [PATCH] Fixing rshd/rlogind configuration and make
 target
In-Reply-To: <528A2585.5040402@gmx.de>
References: <528A2585.5040402@gmx.de>
Message-ID: <20140412171255.26048534@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear universe II,

On Mon, 18 Nov 2013 15:34:45 +0100, universe II wrote:

> +config BR2_PACKAGE_RSH_REDONE_RLOGIND
> +       bool "rlogind"
> +       depends on BR2_PACKAGE_RSH_REDONE

Dependency on BR2_PACKAGE_LINUX_PAM was missing here.

> 
>   config BR2_PACKAGE_RSH_REDONE_RSH
>          bool "rsh"
>          depends on BR2_PACKAGE_RSH_REDONE
> 
>   # requires PAM
> -#config BR2_PACKAGE_RSH_REDONE_RSHD
> -#      bool "rshd"
> -#      depends on BR2_PACKAGE_RSH_REDONE
> +config BR2_PACKAGE_RSH_REDONE_RSHD
> +       bool "rshd"
> +       depends on BR2_PACKAGE_RSH_REDONE

and here.

> diff -Naur rsh-redone_org/rsh-redone.mk rsh-redone/rsh-redone.mk
> --- rsh-redone_org/rsh-redone.mk        2013-09-17 13:42:07.000000000 +0200
> +++ rsh-redone/rsh-redone.mk    2013-10-24 08:23:00.643065545 +0200
> @@ -13,8 +13,8 @@
>   rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RLOGIN) += rlogin
>   rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RSH) += rsh
>   rsh-redone-sbin-y =
> -rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RLOGIND) += rlogind
> -rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RSHD) += rshd
> +rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RLOGIND) += in.rlogind
> +rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RSHD) += in.rshd

and here as well.

I've fixed that up and committed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
