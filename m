From: Vivek Kumar Gautam <vivek.gautam@arm.com>
Date: Mon, 11 Jan 2021 19:52:42 +0530
Subject: [Buildroot] [PATCH] configs/aarch64_rdinfra: add new config for
 infra rd plaforms
In-Reply-To: <9755e6ac-fa23-67ed-cdaa-9606038342de@arm.com>
References: <20201126100507.27484-1-vivek.gautam@arm.com>
 <8bb9244f-9ac1-a265-bd22-5d05b642c2dc@arm.com>
 <9755e6ac-fa23-67ed-cdaa-9606038342de@arm.com>
Message-ID: <c08e8bcb-d8c3-ceaf-47d4-cafb1de4354a@arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 1/8/21 2:20 PM, Vivek Kumar Gautam wrote:
> Hi all,
> 
> 
> On 12/5/20 10:59 AM, Vivek Kumar Gautam wrote:
>> Hi,
>>
>>
>> On 11/26/20 3:35 PM, Vivek Kumar Gautam wrote:
>>> This defconfig enables Arm aarch64 Infra RD platforms to use
>>> buildroot backed ramdisks to perform simple unit/sanity testing.
>>> These infra platforms are currently enabled with a scripts based
>>> build system as can be seen in linaro public repos[1]. A busybox
>>> based boot is also enabled[2].
>>> We plan to use buildroot for a richer experience while testing and
>>> therefore this config.
>>> This config will also be first step towards enabling buildroot
>>> based build system for infra rd platforms in near future.
>>> It comes with following minimal stuff -
>>> ? -neoverse_n1 cpu
>>> ? -bash shell
>>> ? -vim
>>> ? -pciutils
>>> ? -libdtc
>>> ? -screen
>>>
>>> [1] 
>>> https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/about/ 
>>>
>>> [2] 
>>> https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/about/docs/rdn1edge/how-to/busybox-boot.rst 
>>>
>>>
>>> Signed-off-by: Vivek Kumar Gautam <vivek.gautam@arm.com>
>>> ---
>>> ? configs/aarch64_rdinfra_defconfig | 21 +++++++++++++++++++++
>>> ? 1 file changed, 21 insertions(+)
>>> ? create mode 100644 configs/aarch64_rdinfra_defconfig
>>>
>>> diff --git a/configs/aarch64_rdinfra_defconfig 
>>> b/configs/aarch64_rdinfra_defconfig
>>> new file mode 100644
>>> index 0000000000..71e44e537c
>>> --- /dev/null
>>> +++ b/configs/aarch64_rdinfra_defconfig
>>> @@ -0,0 +1,21 @@
>>> +# Architecture
>>> +BR2_aarch64=y
>>> +
>>> +# Processor
>>> +BR2_neoverse_n1=y
>>> +
>>> +# Toolchain
>>> +BR2_TOOLCHAIN_EXTERNAL=y
>>> +
>>> +# Additional system packages
>>> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>>> +BR2_PACKAGE_PCIUTILS=y
>>> +BR2_PACKAGE_DTC=y
>>> +BR2_PACKAGE_DTC_PROGRAMS=y
>>> +BR2_PACKAGE_LIBEVENT=y
>>> +BR2_PACKAGE_BASH=y
>>> +BR2_PACKAGE_SCREEN=y
>>> +BR2_PACKAGE_VIM=y
>>> +
>>> +# Target filesystem
>>> +BR2_TARGET_ROOTFS_CPIO=y
>>
>> Gentle ping. Any comments on this?
> 
> I will be more than happy to address any feedback on this config patch.
> Please let me know if there are missing pieces.
> 

My apologies for spamming as it looks like a 'Disclaimer' message 
managed to sneak in with my responses. I have tried to fix it this time.

Kindly let me know comments on this patch.

Thanks & regards
Vivek
