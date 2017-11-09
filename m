From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 9 Nov 2017 19:48:31 +0100
Subject: [Buildroot] [PATCH v2 1/1] add sunxi-mali mainline kernel
In-Reply-To: <20171109184305.ntt5ghwe4p3qdtld@tarshish>
References: <1510250621-27660-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20171109184305.ntt5ghwe4p3qdtld@tarshish>
Message-ID: <147f5bce-6dc7-a4cb-7271-c730204f190d@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Il 09/11/2017 19:43, Baruch Siach ha scritto:
> Hi Giulio,
> 
> On Thu, Nov 09, 2017 at 07:03:41PM +0100, Giulio Benetti wrote:
>> As it's not present in buildroot,
>> add support for sunxi-mali mainline kernel driver.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>> Changes v1 -> v2:
>> * use github macros
>> * use build.sh to compile and install
>> * add check linux >= 4.4
>>
>>   package/sunxi-mali-driver-mainline/Config.in       | 10 +++++++++
>>   .../sunxi-mali-driver-mainline.mk                  | 26 ++++++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>   create mode 100644 package/sunxi-mali-driver-mainline/Config.in
>>   create mode 100644 package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
>>
>> diff --git a/package/sunxi-mali-driver-mainline/Config.in b/package/sunxi-mali-driver-mainline/Config.in
>> new file mode 100644
>> index 0000000..1d7d313
>> --- /dev/null
>> +++ b/package/sunxi-mali-driver-mainline/Config.in
>> @@ -0,0 +1,10 @@
>> +comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
>> +	depends on !BR2_LINUX_KERNEL
>> +
>> +config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
>> +	bool "sunxi-mali-driver-mainline"
>> +	depends on BR2_LINUX_KERNEL
>> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
> 
> You want to check that the kernel you build is 4.4 or later. The toolchain
> headers have nothing to do with that. These headers are not used when you
> build the kernel.

You're right, as I see there is no way in Buildroot to check this.
So I only can add this in help section.
Right?

> 
>> +	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
>> +	help
>> +	  Sunxi Mali Kernel space driver
> 
> baruch
> 

Cheers
-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
