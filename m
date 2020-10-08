From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Oct 2020 09:06:36 +0200
Subject: [Buildroot] [PATCH 1/2] defconfigs: use
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_
In-Reply-To: <CANQCQpbXVnhDeMPc-srQu8EMfxhQH5OCZ9mwuTdQ9570-LgCgg@mail.gmail.com>
References: <20201007132052.29560-1-matthew.weber@rockwellcollins.com>
 <fa555322-e273-94ff-0f36-b22e579eaeb1@mind.be>
 <CANQCQpbXVnhDeMPc-srQu8EMfxhQH5OCZ9mwuTdQ9570-LgCgg@mail.gmail.com>
Message-ID: <55bdaa63-14e2-02ee-13ac-50a62b3a8932@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/10/2020 21:30, Matthew Weber wrote:
> Arnout,
> 
> 
> On Wed, Oct 7, 2020 at 2:26 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 07/10/2020 15:20, Matt Weber wrote:
>>> --- a/configs/bananapi_m1_defconfig
>>> +++ b/configs/bananapi_m1_defconfig
>>> @@ -21,8 +21,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
>>>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>>>  BR2_TARGET_UBOOT_SPL=y
>>>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>>> -BR2_TARGET_UBOOT_BOOT_SCRIPT=y
>>> -BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m1/boot.cmd"
>>> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
>>> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m1/boot.cmd"
>>>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>>  BR2_PACKAGE_HOST_GENIMAGE=y
>>>  BR2_PACKAGE_HOST_MTOOLS=y
>>> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>>
>>  Just appending it at the end is not so nice (especially for the defconfigs that
>> are manually formatted). So I've moved it to just before the existing location,
>> with a few exceptions. This is the addition to the commit message:
> 
> I noticed we weren't consistent with manual vs not.  What is the
> motivation for the manual formatting?

 The in-tree defconfigs are kind of documentation. Comments like "Linux headers
same as kernel, a 4.18 series" are useful.

 Regards,
 Arnout
