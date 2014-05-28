From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 28 May 2014 11:41:20 +0200
Subject: [Buildroot] [PATCH v2] Adding support for Ariag25 and Terra
 board from Acmesystems
In-Reply-To: <5385811C.6090700@mind.be>
References: <1400875790-20928-1-git-send-email-angelo.compagnucci@gmail.com>
 <5385811C.6090700@mind.be>
Message-ID: <CA+TH9VkHekXsKwQa5kG1Ygo1snafDCwC+fHbcQ0kRF9BEsZ9Rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> +CONFIG_SOC_AT91SAM9260=y
>> +CONFIG_SOC_AT91SAM9261=y
>> +CONFIG_SOC_AT91SAM9263=y
>> +CONFIG_SOC_AT91SAM9RL=y
>> +CONFIG_SOC_AT91SAM9G45=y
>> +CONFIG_SOC_AT91SAM9X5=y
>> +CONFIG_SOC_AT91SAM9N12=y
>
>  Any reason to support all these different chips?

I used the kernel config provided by Acmesystems, do you think it
should be reviewed?

>> +CONFIG_MACH_AT91SAM9_DT=y
>> +CONFIG_AT91_TIMER_HZ=128
>> +CONFIG_AEABI=y
> [snip]
>> +CONFIG_EXT4_FS=y
>> +CONFIG_EXT4_FS_POSIX_ACL=y
>
>  Why do you need ext4 support?

Why not? EXT4 is ubiquitous and used extensively on AriaG25 / Terra board.

>> diff --git a/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces b/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces
>> new file mode 100644
>> index 0000000..104c1a1
>> --- /dev/null
>> +++ b/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces
>
>  You're not actually using this in your defconfigs...

Ouch, big mistake, sorry.

>> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
>
>  There's no reason to have this in the minimal defconfig.

Ok, I'll remove it

>> +BR2_TARGET_GENERIC_HOSTNAME="ariag25"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to AriaG25 by www.acmesystems.it!"
>> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/acmesystems/ariag25/at91-ariag25.config"
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
>> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/ariag25/at91-ariag25.dts"
>
>  Since you create just a root filesystem and a kernel, not even a bootloader,
> I'd expect a README file with an explanation how you get this stuff on your device.

Ok, I will add the at91  bootloader.

>> +BR2_PACKAGE_PYTHON=y
>> +BR2_PACKAGE_PYTHON_SQLITE=y
>> +BR2_PACKAGE_PYTHON_ZLIB=y
>> +BR2_PACKAGE_PYTHON_SERIAL=y
>> +BR2_PACKAGE_DROPBEAR=y
>> +BR2_PACKAGE_IPUTILS=y
>> +BR2_PACKAGE_NTP=y
>> +BR2_PACKAGE_OPKG=y
>
>  I like the fact that we get our first demo config. However, I don't understand
> the choice of packages here. dropbear makes a lot of sense of course, but the
> others just seem a bit random. In this case, I don't think the demo config makes
> a lot of sense.

It should be a rationale for a demo board? I choose that packages
because the provides a minimal support to run the examples provided on
the manufacturer's website.
Why do you think they are randomly chosen?
Python packages are useful for running website examples, iputils
contains basic useful commands as ping, ntp is ntp, and OPKG makes
possible to add other pre-compiled software from
http://feeds.angstrom-distribution.org/

I don't think it' so random :) !

Sincerly,

Angelo
