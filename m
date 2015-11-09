From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Mon, 9 Nov 2015 12:55:25 +0100
Subject: [Buildroot] [PATCH] configs: new configuration for at91sam9g20ek
In-Reply-To: <1447032023-6229-1-git-send-email-jenskamenik@googlemail.com>
References: <1447032023-6229-1-git-send-email-jenskamenik@googlemail.com>
Message-ID: <20151109115525.GA4302@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jens,

A few small nitpicks below:

On 09/11/2015 at 02:20:23 +0100, Jens Kamenik wrote :
> --- a/board/atmel/flasher.sh
> +++ b/board/atmel/flasher.sh
> @@ -20,6 +20,10 @@ family_at91sam9g25ek="at91sam9x5ek"
>  mach_at91sam9g25ek="at91sam9g25-ek"
>  dtb_at91sam9g25ek="at91sam9g25ek.dtb"
>  
> +family_at91sam9g20ek="at91sam9g20ek"
> +mach_at91sam9g20ek="at91sam9g20-ek"
> +dtb_at91sam9g20ek="at91sam9g20ek.dtb"
> +
>  family_at91sam9g35ek="at91sam9x5ek"
>  mach_at91sam9g35ek="at91sam9g35-ek"
>  dtb_at91sam9g35ek="at91sam9g35ek.dtb"
> @@ -93,6 +97,7 @@ Available boards:
>    at91sam9g45m10ek
>    at91sam9rlek
>    at91sam9g15ek
> +  at91sam9g20ek

regarding the sort order, I'd say that at91sam9g20ek is not between
at91sam9g15ek and at91sam9g25ek (both part of the at91sam9x5 familiy). I
would place it before at91sam9g45m10ek. That comment is also valid for
the family_, mach_ and dtb_ definitions

>    at91sam9g25ek
>    at91sam9x25ek
>    at91sam9g35ek

[...]

> diff --git a/configs/at91sam9g20ek_defconfig b/configs/at91sam9g20ek_defconfig
> new file mode 100644
> index 0000000..10125e1
> --- /dev/null
> +++ b/configs/at91sam9g20ek_defconfig
> @@ -0,0 +1,23 @@
> +BR2_arm=y
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="3.18"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y

These can probably be updated to 4.1

Everything else seems OK, thanks for your patch.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
