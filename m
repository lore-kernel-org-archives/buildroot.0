From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Mar 2021 22:35:45 +0100
Subject: [Buildroot] [RFC/next v2 1/2] package/rpi-firmware: rework
 boot/config file handling
In-Reply-To: <20210309212942.GP2737665@scaer>
References: <20210216201148.26688-1-ps.report@gmx.net>
 <20210308215541.GB2737665@scaer> <20210308231454.519fa1dc@gmx.net>
 <20210308222753.GE2737665@scaer> <20210309213246.382d07b4@gmx.net>
 <20210309212942.GP2737665@scaer>
Message-ID: <20210309213545.GQ2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-09 22:29 +0100, Yann E. MORIN spake thusly:
[--SNIP--]
> OK, so here's my new proposal:
> 
>   - keep your BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE, which points to a
>     default, basic one, not unlike the busybox default config:
>         default "package/rpi-firmware/config.txt"

I meant:  "not unlike what we do with the busybox default config"

Sorry for any confusion...

Regards,
Yann E. MORIN.

>   - package/rpi-firmware/config.txt is just the common part of all the
>     config.txt you currently had in your patch
> 
>   - rpi-firmware.mk will add arm_64bit=1 as needed, based on
>     BR2_aarch64=y, because that *really* is not an option.
> 
>   - add BR2_PKG_RPI_FW_DTOVERLAY_LIST as I suggest above, which is not
>     empty, will be copied as is to dtoverlay
> 
>   - change the defconfig files to just set:
>     BR2_PKG_RPI_FW_DTOVERLAY_LIST="miniuart-bt"
> 
> That way, we get best of both worlds:
> 
>   - we avoid duplication of the config.txt, and we can still customise
>     it a bit with just "easy stuff" that we need for our example
>     defconfigs,
> 
>   - users can stil point to their custom, fine-tuned config.txt (in
>     which case they will probably not set BR2_PKG_RPI_FW_DTOVERLAY_LIST)
> 
> Thoughts?
> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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
