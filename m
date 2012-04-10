From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 10 Apr 2012 18:56:13 +0200
Subject: [Buildroot] [PATCH v2 2/2] BeagleBone: new board
In-Reply-To: <CA+-urNS5R_3bUY_SjVFFE3nMfdDN60O_-jJALKzo3cpu2my0fw@mail.gmail.com>
References: <1331561609-26989-1-git-send-email-fhunleth@troodon-software.com>	<4F803D6E.2020402@relinux.de>
 <CA+-urNS5R_3bUY_SjVFFE3nMfdDN60O_-jJALKzo3cpu2my0fw@mail.gmail.com>
Message-ID: <4F84662D.8070906@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 10.04.2012 01:27, schrieb Frank Hunleth:
> Hi Stephan,
>
> On Sat, Apr 7, 2012 at 9:13 AM, Stephan Hoffmann <sho@relinux.de> wrote:
>> Am 12.03.2012 15:13, schrieb Frank Hunleth:
>>> This configuration uses the latest released kernel and u-boot versions
>>> supported by Beagleboard developers. The Linux kernel configuration has
>>> been modified to compile in EXT2 support and use gzip to compress the
>>> kernel.
>>>
>>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>> Tested-by: Stephan Hoffmann <sho@relinux.de>
>>
>> CONFIG_EXT3_FS=m has to be changed to "y" to boot with the supplied u-boot configuration.
> Thanks a lot for testing the patch and reporting back.
>
> It is interesting that ext3 needs to be turned on. The patch to u-boot
> which *should* have been applied should have changed the ext3 config
> reference to ext2. However, I haven't been paying close attention to
> the BR list for the past couple weeks and my patch could be out of
> date now.
Hello Frank,

at least, I prefer having ext3;-)  What would be a reason to stick to ext2?
> Having said this, I need to update my patch anyway. Nicolas Dechesne
> submitted an SPL bootloader patch that I'd like to base the new patch
> off of once it gets in. Also, the Linux config that I submitted feels
> way too bloated for BR. If you need something sooner, my current
> configs are at:
>
> https://github.com/nerves-project/bbone-erlang-buildroot/blob/master/configs/beaglebone_defconfig
>
> and
>
> https://github.com/nerves-project/bbone-erlang-buildroot/blob/master/board/beaglebone/linux-3.2.9.config
I'll have a look at these. I've also thrown out lots of drivers to get a
compact system.

Kind regards

Stephan
> The main change is that no longer compiles many drivers, and hardware
> float is enabled on the compiler. Since I haven't rebased that tree in
> a while, you'll probably need to make the ext3 change again.
>
> Thanks,
> Frank


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
