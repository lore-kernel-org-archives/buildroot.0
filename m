From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 10:08:09 +0100
Subject: [Buildroot] [PATCH v3 2/4] configs/qemu_arm_vexpress_tz:
 Armv7-A emulation with TrustZone services
In-Reply-To: <CAN5uoS91nUDOxV10c6xVjt7-i_se8BtuvW+8+ch5V4Z+3KDwAg@mail.gmail.com>
References: <20190322095818.19914-1-etienne.carriere@linaro.org>
 <20190322095818.19914-2-etienne.carriere@linaro.org>
 <306f7cc3-cdb9-0441-5a0a-7d21651ece72@mind.be>
 <CAN5uoS-d3eO1D-Gd3QbWrbaT6HXNoOz3hi4kaK2Px+R2chM5Jw@mail.gmail.com>
 <CAN5uoS91nUDOxV10c6xVjt7-i_se8BtuvW+8+ch5V4Z+3KDwAg@mail.gmail.com>
Message-ID: <9df64877-e78c-5938-69d2-5044a91f8c64@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/10/2019 09:11, Etienne Carriere wrote:
> On Tue, 29 Oct 2019 at 09:08, Etienne Carriere
> <etienne.carriere@linaro.org> wrote:
>>
>> On Sun, 27 Oct 2019 at 15:55, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> [snip]
>>>
>>>> +BR2_TARGET_UBOOT=y
>>>
>>>  You have to specify the U-Boot version. I'm not sure what you tested with, but
>>> I used 2019.01 and it worked.
>>
>> Would be nice to use BR2_TARGET_UBOOT_LATEST_VERSION.
>> BR2_TARGET_UBOOT_LATEST_VERSION=y
>>
>> As for the linux kernel, i wonder if the generic config would be better?
> 
> Sorry: mail popped from my fingers while I was typing.
> 
> I meant, would it be better if the qemu/tz defconfig is based on:
> BR2_TARGET_UBOOT_LATEST_VERSION=y
> BR2_LINUX_KERNEL_LATEST_VERSION=y
> BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y

 You original submission had this, and that didn't build because some of the
config options were invalid. That shows that you *have* to have the version.

 Regards,
 Arnout
