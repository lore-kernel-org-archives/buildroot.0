From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 9 Nov 2020 20:23:16 +0100
Subject: [Buildroot] Activate Wifi on my STM32
In-Reply-To: <AM0PR10MB2433D0231B9FBA5F1BBCAD7782100@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
References: <AM0PR10MB243337C1066FAD682FBBB9C282130@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
 <CALxJ29RGQqeFL9b32KRQC9ncuG5Np+pjSn1HO87gdTPeYZoORQ@mail.gmail.com>
 <AM0PR10MB2433D0231B9FBA5F1BBCAD7782100@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
Message-ID: <7fd28589-cef1-3580-ced9-41185770af70@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kevin,


On 02.11.2020 10:28, Kevin Tomary wrote:
> Hello Shlomi,
>
> Well thank you for your response. I understood some specific things 
> here but I didn't understand why you are talking about Yocto St. I am 
> using Buildroot.
> I mean the first paragraph you provided was clear there is a lack of 
> communication between the hardware and the Buildroot Linux System.? 
> Does this mean that there is no possible way to have the Wi-Fi feature 
> using buildroot?
> According to some searches that I made the Wi-Fi support is working 
> out of the box in buildroot. But you have to enable the wpa_supplicant 
> package and create a /etc/wpa_supplicant file with your Wi-Fi 
> credentials. For generating the inital buildroot config use:
> *make stm32mp157_<board>_defconfig* command
>
> The wifi setup is as mentioned only adding the package and wpa 
> supplicant file.I?can use the file system overlay option in buildroot
>
> Best Regards
>
> Kevin

The built-in wlan module on stm32mp157c-dk2 devboard is very unstable 
(don't know yet why) so the easiest way to have WiFi support is by using 
an external wlan usb card that is supported by the mainline linux kernel.

I'm gonna fix that but currently I'm a little bit busy.


Best

Bartek

> ------------------------------------------------------------------------
> *From:* Shlomi Vaknin <shlomi.39sd@gmail.com>
> *Sent:* Sunday, November 1, 2020 11:17 PM
> *To:* Kevin Tomary <kevin.tomary@hotmail.com>
> *Cc:* buildroot at busybox.net <buildroot@busybox.net>
> *Subject:* Re: [Buildroot] Activate Wifi on my STM32
> Hello Kevin!
>
> Buildroot compiles the mainline kernel repository. Unfortunately, 
> there are no dts bindings for the wifi chip (in normal vocab - nothing 
> tells the os that the wifi chip is on the board).
> There was a discussion about that about a month ago in buildroot. 
> Adding the relevant dts bindings did not work and this issue needs 
> deeper investigation. If you still want this you can do one of the 
> following:
> 1. Use the yocto build system instead of yocto - st formally supports 
> that and the wifi works perfectly there.
> 2. Compile the linux kernel repository provided by st (in github) 
> instead of the mainline repository. In that case, you need to change 
> the linux.config file and add the brcmfmac driver.
>
> In addition, you need to install the linux firmware package from 
> murata (BR2_PACKAGE_MURATA_CYW_FW=y) and enable the specific wifi chip 
> (BR2_PACKAGE_MURATA_CYW_FW_CYW43430=y).
> After?that, you need to use some userspace tools to connect to router. 
> wpa-supplicant is enough, but it is useful to install iw tools as 
> well. If you really want that to be easy, use the network-manager 
> package and nmtui (comes with network manager).
> If you picked yocto, it will install for you most of the packages 
> listed above (if you enable wifi in DISTRO_FEATURES - no normal vocab 
> for that, sorry ;)).
> If you really new to embedded linux and the first paragraph is not so 
> clear for you, than I am suggesting you to learn embedded linux using 
> the wonderful training materials that are freely available from 
> bootilin: https://bootlin.com/training/
> Start with the embedded linux training as it has labs specifically for 
> the stm32mp1 (yocto training too, btw). Good luck!
>
> Regards,
> Shlomi
>
> ??????? ??? ??, 1 ????? 2020 ?-15:08 ??? ?Kevin Tomary?? 
> <?kevin.tomary at hotmail.com <mailto:kevin.tomary@hotmail.com>??>:?
>
>     Hello
>
>     I would like to know the steps to activate WiFi on my MPU using
>     Buildroot image. I didn't find a guideline or someone working on that.
>
>     I would like to know which packages to install and files to
>     configure and manipulate in order to have access to it.
>
>     I am using an STM32MP157C-DK2? flashed with a buildroot image. I
>     succeeded in making Ethernet working perfectly. Now I want my MPU
>     to work with Wi-Fi.
>
>     P.s I am new to embedded Linux so please talk to me with some
>     normal vocab. I am learning by doing.
>
>     Best Regards
>
>     Kevin
>     _______________________________________________
>     buildroot mailing list
>     buildroot at busybox.net <mailto:buildroot@busybox.net>
>     http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-- 
*BARTOSZ BI?AS*
Embedded Software Developer 	GRINN

TEL.+48 71 716 40 99
WEB. grinn-global.com
	Grinn sp. z o.o.
Strzegomska 140a
54-429 Wroc?aw
	KRS:0000230049
NIP:8992730302
REGON:020047322 	S?d Rejonowy we Wroc?awiu
VI Wydzia? Gospodarczy
Kapita? zak?adowy: 125.000,00 z?


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201109/e47eeec0/attachment.html>
