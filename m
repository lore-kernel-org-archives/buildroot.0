From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Sat, 5 Jan 2019 22:39:06 +0100
Subject: [Buildroot] [PATCH 1/1] linux-firmware: add options to install
 more Mediatek firmwares.
In-Reply-To: <20190105150932.431a1a83@windsurf>
References: <20190104154951.21807-1-nicolas.cavallari@green-communications.fr>
 <20190104161404.GC19623@scaer> <20190105150932.431a1a83@windsurf>
Message-ID: <38279791-d4f9-08c1-eee6-4094db1404f2@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/2019 15:09, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 4 Jan 2019 17:14:04 +0100, Yann E. MORIN wrote:
> 
>> We're trying to limit the number of options in each category, and given
>> there already is a wifi mediatek entry above, can we just make it install
>> all the mediatek wifi firmwares?
> 
> I'm not sure I agree here.

(I probably should have waited before writing a patch doing exactly
that, hopefully i didn't tested it

I will just mention that "all the mediatek firmwares" also include more
files in linux-firmware's mediatek/ directory. But the situation there
is more complicated. the mt76/btmtk drivers are still under active
development, and they will stop using some firmware files.)

>>   - rename the option to BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_WIFI_MT7xxx;
>>     note that I added 'WIfI' in the option name, because we can forsee
>>     we'll have the same issue with BT firmwares, as they too are named
>>     mt7*;
> 
> If you have a WiFi/BT combo chip, it's pretty likely that you will want
> to install both the WiFi and BT firmwares, so having a single option
> for both doesn't look that crazy.

Well, currently the menuconfig for bluetooth and wifi are splitted.

And in this case, there is no firmware that is specific to a WiFi/BT
combo chip. The mt7662.bin file is used by both wifi and wifi/bt combos
and so is mt7650.bin for bt and wifi/bt.
