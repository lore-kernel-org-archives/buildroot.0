From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 26 Oct 2016 22:13:44 +0200
Subject: [Buildroot] raspberry pi 3 wifi in default build
In-Reply-To: <1644680147.2566209.1476806733728@mail.yahoo.com>
References: <1644680147.2566209.1476806733728.ref@mail.yahoo.com>
 <1644680147.2566209.1476806733728@mail.yahoo.com>
Message-ID: <ec2e47ae-5221-0cfa-a575-f3ab9b6dafba@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 18/10/2016 ? 18:05, Mikhail Tchernychev a ?crit :
> Hi,
> 
> I tried to enable build in wifi in rpi3,  no success so far.
> raspberry3_defconfig  seem does not have it enabled.
> I tried  to add BCM43438 but still no luck. In contrary openwrt build for Rpi 3
> has it (I built openwrt myself)
> 
> Sorry if it was already asked, search button on mail list returns "server not
> found" to me.  I searched few
> month by hand but seen did not find anything similar.
> 
> The question is how to enable wifi on rapsberry pi 3 ?

This issue has already been discussed in this thread recently [1], the rpi3 wifi
support is not available/enabled with the raspberry3_defconfig.

So, you have to select the linux-firmware package and select
BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX. But linux-fimware provide only the .bin.

As reported by Floris Bos, you also need [2] on your target.

I don't really understand why the .txt is not provided by linux-firmware...

Best regards,
Romain

[1] http://lists.busybox.net/pipermail/buildroot/2016-September/172261.html
[2]
https://github.com/RPi-Distro/firmware-nonfree/blob/master/brcm80211/brcm/brcmfmac43430-sdio.txt

> Thank you
> 
> 
> Best Regards, Mikhail Tchernychev
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
