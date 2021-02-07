From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 07 Feb 2021 19:00:43 +0200
Subject: [Buildroot] [PATCH] configs/avenger96_defconfig: add support
 for Arrow Avenger96 board
In-Reply-To: <20210207165237.GP2384@scaer>
References: <20210207155534.7211-1-peter@korsgaard.com>
 <87h7mnyi4p.fsf@tarshish> <20210207165237.GP2384@scaer>
Message-ID: <87eehryfr8.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Feb 07 2021, Yann E. MORIN wrote:
> On 2021-02-07 18:09 +0200, Baruch Siach spake thusly:
>> On Sun, Feb 07 2021, Peter Korsgaard wrote:
>> > +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
>> Maybe warn that this overwrites data on the SD card.
>
> As far as I could see, we don't do that in any of the 72 readme.txt we
> already have...

$ git grep WARNING -- board/
...
board/chromebook/elm/readme.txt:WARNING: make sure there is nothing important on that card,
board/chromebook/snow/readme.txt:WARNING: make sure there is nothing important on that card,
board/engicam/geam6ul/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/engicam/icorem6/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/engicam/icorem6_rqs/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/engicam/isiot/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/imx23evk/readme.txt:*** WARNING! The command will destroy all the card content. Use with care! ***
board/freescale/imx25pdk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/imx28evk/readme.txt:*** WARNING! The command will destroy all the card content. Use with care! ***
board/freescale/imx51evk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/imx6-sabresd/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/imx6sabre/readme.txt:*** WARNING! The script will destroy all the card content. Use with care! ***
board/freescale/imx6ulevk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/imx6ullevk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/imx7dsdb/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/imx8mmevk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/imx8mnevk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/imx8mqevk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/imx8qmmek/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/imx8qxpmek/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/freescale/warpboard/README:*** WARNING! This will destroy all the eMMC content. Use it with care! ***
board/grinn/chiliboard/readme.txt:*** WARNING! This will destroy all contents of device you specify! ***
board/grinn/liteboard/readme.txt:*** WARNING! This will destroy all contents of device you specify! ***
board/olimex/imx233_olinuxino/readme.txt:*** WARNING! The command will destroy all the card content. Use with care! ***
board/qmtech/zynq/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/solidrun/clearfog/readme.txt:*** WARNING! The dd command will destroy all the card content. Use with care! ***
board/technexion/imx6ulpico/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
board/technexion/imx7dpico/readme.txt:*** WARNING! This will destroy all the eMMC content. Use with care! ***
board/technexion/imx8mmpico/readme.txt:*** WARNING! This will destroy all the eMMC content. Use with care! ***
board/technexion/imx8mpico/readme.txt:*** WARNING! This will destroy all the eMMC content. Use with care! ***
board/warp7/readme.txt:*** WARNING! This will destroy all the eMMC content. Use it with care! ***
board/zynqmp/readme.txt:WARNING! This will destroy all the card content. Use with care!

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
