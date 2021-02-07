From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun, 7 Feb 2021 18:52:16 +0100
Subject: [Buildroot] [PATCH] configs/avenger96_defconfig: add support
 for Arrow Avenger96 board
In-Reply-To: <87eehryfr8.fsf@tarshish>
References: <20210207155534.7211-1-peter@korsgaard.com>
 <87h7mnyi4p.fsf@tarshish> <20210207165237.GP2384@scaer>
 <87eehryfr8.fsf@tarshish>
Message-ID: <a86ec3d8-17d5-bd4d-d6e9-f0d29071eeb4@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On 2/7/21 6:00 PM, Baruch Siach wrote:
> Hi Yann,
>
> On Sun, Feb 07 2021, Yann E. MORIN wrote:
>> On 2021-02-07 18:09 +0200, Baruch Siach spake thusly:
>>> On Sun, Feb 07 2021, Peter Korsgaard wrote:
>>>> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
>>> Maybe warn that this overwrites data on the SD card.
>> As far as I could see, we don't do that in any of the 72 readme.txt we
>> already have...
> $ git grep WARNING -- board/
> ...
> board/chromebook/elm/readme.txt:WARNING: make sure there is nothing important on that card,
> board/chromebook/snow/readme.txt:WARNING: make sure there is nothing important on that card,
> board/engicam/geam6ul/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/engicam/icorem6/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/engicam/icorem6_rqs/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/engicam/isiot/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/imx23evk/readme.txt:*** WARNING! The command will destroy all the card content. Use with care! ***
> board/freescale/imx25pdk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/imx28evk/readme.txt:*** WARNING! The command will destroy all the card content. Use with care! ***
> board/freescale/imx51evk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/imx6-sabresd/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/imx6sabre/readme.txt:*** WARNING! The script will destroy all the card content. Use with care! ***
> board/freescale/imx6ulevk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/imx6ullevk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/imx7dsdb/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/imx8mmevk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/imx8mnevk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/imx8mqevk/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/imx8qmmek/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/imx8qxpmek/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/freescale/warpboard/README:*** WARNING! This will destroy all the eMMC content. Use it with care! ***
> board/grinn/chiliboard/readme.txt:*** WARNING! This will destroy all contents of device you specify! ***
> board/grinn/liteboard/readme.txt:*** WARNING! This will destroy all contents of device you specify! ***
> board/olimex/imx233_olinuxino/readme.txt:*** WARNING! The command will destroy all the card content. Use with care! ***
> board/qmtech/zynq/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/solidrun/clearfog/readme.txt:*** WARNING! The dd command will destroy all the card content. Use with care! ***
> board/technexion/imx6ulpico/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
> board/technexion/imx7dpico/readme.txt:*** WARNING! This will destroy all the eMMC content. Use with care! ***
> board/technexion/imx8mmpico/readme.txt:*** WARNING! This will destroy all the eMMC content. Use with care! ***
> board/technexion/imx8mpico/readme.txt:*** WARNING! This will destroy all the eMMC content. Use with care! ***
> board/warp7/readme.txt:*** WARNING! This will destroy all the eMMC content. Use it with care! ***
> board/zynqmp/readme.txt:WARNING! This will destroy all the card content. Use with care!
>
> baruch
>
Is not that obvious that dd will overwrite the data? Imo it's 
superfluous information at all.

Best
Bartek
