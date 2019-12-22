From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 17:24:48 +0100
Subject: [Buildroot] [PATCH 1/3] package/usb_modeswitch: fix license
In-Reply-To: <20191222110646.2201048-1-fontaine.fabrice@gmail.com>
References: <20191222110646.2201048-1-fontaine.fabrice@gmail.com>
Message-ID: <20191222162448.GH26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-12-22 12:06 +0100, Fabrice Fontaine spake thusly:
> dispatcher.c is licensed under BSD-2-Clause
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series aplied, thanks. However, I did a few changes, see belos:

  - I merged patches 1 and 2 to gether, as I did not see the point of
    adding tweaking the licensing info twice;

  - speakign of the licensing info, I simplified the license list: we
    usually only list parts of the package affected by the different
    licenses, when those parts are optional or clearly separated (like
    libs vs. programs), which is not the case here; we do not
    differentiate based on the source files affecte by the licenses;

  - I added the md5 hash provided by upstream. md5 is a weak hash, but
    it is provided by upstream, so we want to carry it.

Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/usb_modeswitch/usb_modeswitch.hash | 1 +
>  package/usb_modeswitch/usb_modeswitch.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
> index 3cbd370e2c..0b180f9789 100644
> --- a/package/usb_modeswitch/usb_modeswitch.hash
> +++ b/package/usb_modeswitch/usb_modeswitch.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated
>  sha256	abffac09c87eacd78e101545967dc25af7e989745b4276756d45dbf4008a2ea6  usb-modeswitch-2.5.2.tar.bz2
>  sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> +sha256	929bfd332292f8cd33e4401b5cedea3e93ebe6efa99e1d3626884cacb59ff208  dispatcher.c
> diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
> index 9832d3c808..5b60a3c5dc 100644
> --- a/package/usb_modeswitch/usb_modeswitch.mk
> +++ b/package/usb_modeswitch/usb_modeswitch.mk
> @@ -8,8 +8,8 @@ USB_MODESWITCH_VERSION = 2.5.2
>  USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
>  USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
>  USB_MODESWITCH_DEPENDENCIES = libusb
> -USB_MODESWITCH_LICENSE = GPL-2.0+
> -USB_MODESWITCH_LICENSE_FILES = COPYING
> +USB_MODESWITCH_LICENSE = BSD-2-Clause (dispatcher.c), GPL-2.0+ (usb_modeswitch{.c,.h,.sh,_dispatcher.tcl})
> +USB_MODESWITCH_LICENSE_FILES = COPYING dispatcher.c
>  # Package does not build in parallel due to improper make rules
>  USB_MODESWITCH_MAKE = $(MAKE1)
>  
> -- 
> 2.24.0
> 
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
