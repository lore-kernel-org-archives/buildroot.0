From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Mar 2016 00:15:13 +0100
Subject: [Buildroot] [v3,
 4/4] beaglebone: adds barebox bootloader defconfig
In-Reply-To: <20160229084432.GA18909@smipidev>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-5-git-send-email-pieter@boesman.nl> <56D0E40E.40800@mind.be>
 <20160229084432.GA18909@smipidev>
Message-ID: <56D62281.8090502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/29/16 09:44, Pieter Smith wrote:
> On Sat, Feb 27, 2016 at 12:47:26AM +0100, Arnout Vandecappelle wrote:
>> On 01/20/16 23:43, Pieter Smith wrote:
>>> * Builds barebox MLO and the barebox bootloader.
>>> * Barebox integrates a perfectly good device-tree for the bbb, so no dtb is
>>>   being generated with the kernel.
> 
> [snip]
> 
>>> +# kernel
>>> +BR2_LINUX_KERNEL=y
>>> +BR2_LINUX_KERNEL_LATEST_VERSION=y
>>
>>  Kernel version should be locked down as well.
> 
> ACK. Will do.
> 
>>> +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
>>> +BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>>> +BR2_LINUX_KERNEL_ZIMAGE=y
>>
>>  Perhaps add a comment here that the dtb from barebox will be used.
> 
> A comment in the defconfig file? Not that I am against it, but will anybody
> actually read it?

 Look at the other defconfig files, most of them have comments in them. That's
mostly for people who update the defconfigs, but also for newcomers who take a
look at them to make it easier to understand.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
