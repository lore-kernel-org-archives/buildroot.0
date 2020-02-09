From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 9 Feb 2020 19:49:42 +0100
Subject: [Buildroot] [PATCH v4 3/9] configs/qemu_m68k_q800: remove
 host-qemu
In-Reply-To: <80a8f480-807b-b5a4-d3dd-97c535a7cb0c@smile.fr>
References: <20200209180327.455426-1-romain.naour@smile.fr>
 <20200209180327.455426-4-romain.naour@smile.fr>
 <80a8f480-807b-b5a4-d3dd-97c535a7cb0c@smile.fr>
Message-ID: <6ce8f7ac-fde4-b5c9-bb87-c39ba8fe0392@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 09/02/2020 ? 19:12, Romain Naour a ?crit?:
> Hi,
> 
> Le 09/02/2020 ? 19:03, Romain Naour a ?crit?:
>> Building upstream host-qemu for m68k_q800 is useless
>> since it doesn't support the q800 machine:
>>
>> qemu-system-m68k: -M q800: unsupported machine type
>>
>> This defconfig must be used with the QEMU fork from [1]
>> using q800-v2.11.0 branch.
>>
>> [1] https://github.com/vivier/qemu-m68k
> 
> This patch has been sent for the first time almost one year ago, since then
> m68k_q800 port has been merged upstream and released with Qemu 4.2.0 [1]
> 
> I still need to check if it really work with our qemu defconfig.

Yes, our qemu m68k Q800 defconfig works well with qemu-system-m68k v4.2.0 :)

This patch can be dropped as soon as qemu 4.2.0 is merged in Buildroot.

Best regards,
Romain

> 
> [1]
> https://git.qemu.org/?p=qemu.git;a=commit;h=04e7ca8d0f15a1c185f7b4b5c0de797730c2ed86
> 
> Best regards,
> Romain
> 
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> ---
>>  configs/qemu_m68k_q800_defconfig | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
>> index 2ef73d1dd6..e2a5f27431 100644
>> --- a/configs/qemu_m68k_q800_defconfig
>> +++ b/configs/qemu_m68k_q800_defconfig
>> @@ -23,7 +23,3 @@ BR2_LINUX_KERNEL_VMLINUX=y
>>  # Serial port config
>>  BR2_TARGET_GENERIC_GETTY=y
>>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>> -
>> -# host-qemu for gitlab testing
>> -BR2_PACKAGE_HOST_QEMU=y
>> -BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
>>
> 
