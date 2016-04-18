From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 18 Apr 2016 10:25:46 +0200
Subject: [Buildroot] [PATCH] package/systemd: Optionally disable hwdb
In-Reply-To: <20160415225321.0da4943f@gmx.net>
References: <1460717190-29291-1-git-send-email-m.niestroj@grinn-global.com>
 <20160415225321.0da4943f@gmx.net>
Message-ID: <57149A0A.6050401@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 15.04.2016 22:53, Peter Seiderer wrote:
> Hello Marcin Niestroj,
>
> On Fri, 15 Apr 2016 12:46:30 +0200, Marcin Niestroj <m.niestroj@grinn-global.com> wrote:
>
>> By default hwdb files are installed in /usr/lib/udev/hwdb.d
>> Currently they take about ~5MB. After first boot, systemd-hwdb tool
>> parses them and creates a binary in /etc/udev/hwdb.bin, which takes
>> another ~6.5MB.
>>
>> In case of initramfs images, hwdb parsing is done every boot. This adds
>> about 2-3 seconds to boot time in case of rootfs on SDHC class 10
>> card (benchmarked with am335x board). NAND boot takes even longer.
>>
>
> Perfect for this case would be 'systemd-hwdb update' run at built time to
> create the hwdb files once, but maybe stuff for a follow up patch...

I thought about it. This would propably require compiling part of 
systemd for the host PC, so the build time would be significally 
increased. This can be implemented if someone finds use case for it. For 
now it is ok for me that we totally disable hwdb and save additional 
space of the binary hwdb file.

For OpenEmbedded I saw a patch that was running QEMU to just generate 
the binary hwdb file at build time. I don't think this is an option for us.

-- 
Regards,
Marcin
