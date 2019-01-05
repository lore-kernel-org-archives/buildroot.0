From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Jan 2019 15:09:32 +0100
Subject: [Buildroot] [PATCH 1/1] linux-firmware: add options to install
 more Mediatek firmwares.
In-Reply-To: <20190104161404.GC19623@scaer>
References: <20190104154951.21807-1-nicolas.cavallari@green-communications.fr>
 <20190104161404.GC19623@scaer>
Message-ID: <20190105150932.431a1a83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Jan 2019 17:14:04 +0100, Yann E. MORIN wrote:

> We're trying to limit the number of options in each category, and given
> there already is a wifi mediatek entry above, can we just make it install
> all the mediatek wifi firmwares?

I'm not sure I agree here. For other devices, we have a separate
option for each device. In addition, when you have a given WiFi device
in a system, you most likely only have this one, so the need for
installing one specific firmware is kind of the normal situationo.

>   - rename the option to BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_WIFI_MT7xxx;
>     note that I added 'WIfI' in the option name, because we can forsee
>     we'll have the same issue with BT firmwares, as they too are named
>     mt7*;

If you have a WiFi/BT combo chip, it's pretty likely that you will want
to install both the WiFi and BT firmwares, so having a single option
for both doesn't look that crazy.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
