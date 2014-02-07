From: Anders Darander <anders@chargestorm.se>
Date: Fri, 7 Feb 2014 07:03:30 +0100
Subject: [Buildroot] [PATCH v3 3/4] beaglebone: update to latest U-Boot
In-Reply-To: <20140206223226.3cc86ccc@skate>
References: <1391717684-4244-1-git-send-email-anders@chargestorm.se>
 <1391717684-4244-4-git-send-email-anders@chargestorm.se>
 <20140206223226.3cc86ccc@skate>
Message-ID: <b2a7fb30-6353-4eb6-8f88-37675e3e86a2@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

On 6 February 2014 22:32:26 CET, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>Dear Anders Darander,
>
>On Thu, 6 Feb 2014 21:14:43 +0100, Anders Darander wrote:
>> Update to the default version of U-Boot, at this time 2013.10.
>> 
>> Tested with an old uEnv.txt (i.e. using uImage) and with the
>> currently prefered zImage.
>> 
>> Signed-off-by: Anders Darander <anders@chargestorm.se>
>> ---
>>  configs/beaglebone_defconfig | 2 --
>>  1 file changed, 2 deletions(-)
>> 
>> diff --git a/configs/beaglebone_defconfig
>b/configs/beaglebone_defconfig
>> index 490bed5..6fa8226 100644
>> --- a/configs/beaglebone_defconfig
>> +++ b/configs/beaglebone_defconfig
>> @@ -21,8 +21,6 @@ BR2_DEFAULT_KERNEL_VERSION="3.12.9"
>>  # bootloader
>>  BR2_TARGET_UBOOT=y
>>  BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
>> -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.04"
>
>You should keep these lines and just change it to "2013.10".
>
>The reason is that if you remove these lines, then what the defconfig
>means is "use whatever default version Buildroot has". This is not the
>behavior what we want for defconfig, since we want them to be
>reproducible, as we have no guarantee that newer U-Boot versions will
>continue to work for a given platform.

I really knew this...

I'll respin the patches, likely on Monday morning. Hopefully I can also change the am33x-cm3 patch back to use a git tag instead oh a SHA1 then, at least of TI pushes that tag. 

Do you have any comment on Ryan's suggestion to squash the change to zImage into this patch? 

Cheers, 
Anders 

-- 
ChargeStorm AB / eStorm 
