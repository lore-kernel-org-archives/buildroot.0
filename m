From: =?utf-8?B?TWFyYy1BbmRyw6kgQ2jDqW5pZXI=?= <mac@vrvana.com>
Date: Thu, 9 Jul 2015 00:06:57 +0000
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add missing nvs
 file for the wl18xx firmware
In-Reply-To: <20150708201515.GB3547@free.fr>
References: <1436380795-30694-1-git-send-email-mac@vrvana.com>
 <20150708201515.GB3547@free.fr>
Message-ID: <BN3PR0701MB168812F0F0C568FCD66742F1C6900@BN3PR0701MB1688.namprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Thanks for the review.  I will send a new patch with the refactoring.  For the wl127x and wl128x, the symbolic links were already present and are required.  I will just move them in the lists as suggested.

Regards,

Marc-Andr? Ch?nier, B.ING? | ?Senior Embedded Software Architect at Vrvana |
Visit us in ?http://www.vrvana.com

-----Original Message-----
From: Yann E. MORIN [mailto:yann.morin.1998 at gmail.com] On Behalf Of Yann E. MORIN
Sent: Wednesday, July 08, 2015 4:15 PM
To: Marc-Andr? Ch?nier
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add missing nvs file for the wl18xx firmware

Marc-Andre, All,

On 2015-07-08 14:39 -0400, Marc-Andre Chenier spake thusly:
> Signed-off-by: Marc-Andre Chenier <mac@vrvana.com>

Indeed, wl18xx depends on wlcore, which needs hat firmware file.

But see comments below...

> ---
>  package/linux-firmware/linux-firmware.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk 
> b/package/linux-firmware/linux-firmware.mk
> index 25a942a..f35dba5 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -178,7 +178,10 @@ LINUX_FIRMWARE_FILES += \
>  	ti-connectivity/wl18xx-fw-2.bin \
>  	ti-connectivity/wl18xx-fw-3.bin \
>  	ti-connectivity/wl18xx-fw-4.bin \
> +	ti-connectivity/wl1271-nvs.bin \
>  	ti-connectivity/TIInit_7.2.31.bts
> +# wl1271-nvs.bin (above) is a symlink to:
> +LINUX_FIRMWARE_FILES += ti-connectivity/wl127x-nvs.bin

Just put the two in the same list; keep the comment and move it to the top of the existing list.

BTW, that symlink is not prsent in the other two TI wl127x and 128x lists, just above the one you modified. Is it not needed for those two, or did we forget to add it?

If the latter, can you fix that when you re-spin your patch, please?

Thanks! :-)

Regards,
Yann E. MORIN.

>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity  endif
>  
> --
> 2.4.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
| conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
