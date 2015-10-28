From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Oct 2015 22:47:34 +0100
Subject: [Buildroot] [PATCH v6] board: add support for Synopsys VDK
 Software Development Platform
In-Reply-To: <563141A1.6080009@mind.be>
References: <28a76c89b596d02f7d5b2e8ccfee2d82cfe00569.1445511464.git.jpinto@synopsys.com>
 <563141A1.6080009@mind.be>
Message-ID: <56314276.7030104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-10-15 22:44, Arnout Vandecappelle wrote:
> On 22-10-15 13:01, Joao Pinto wrote:
>> The Virtualizer Development Kit (VDK) Family for ARM Cortex Products
>> consists of a set of virtual prototypes that provide a virtualizer for 
>> the ARM core variants. The VDK is a standalone package that runs on an 
>> host computer.
>>
>> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  One small nit below.

 Silly me, one more thing I forgot...

> 
>> ---
> 
> [snip]
>> diff --git a/configs/snps_aarch64_vdk_defconfig b/configs/snps_aarch64_vdk_defconfig
>> new file mode 100644
>> index 0000000..982158e
>> --- /dev/null
>> +++ b/configs/snps_aarch64_vdk_defconfig
>> @@ -0,0 +1,16 @@
>> +BR2_aarch64=y
>> +BR2_KERNEL_HEADERS_3_18=y
>> +BR2_TARGET_GENERIC_HOSTNAME="vdk-buildroot"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS VDK by Buildroot"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.linaro.org/kernel/linux-linaro-tracking.git"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-linaro-3.18-2014.12"
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/synopsys/vdk/linux-vdk-aarch64-defconfig"
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"

 We now have BR2_LINUX_KERNEL_IMAGE which replaces the above two configs. And
it's even the default for aarch64, so you can just leave these two out.

 Regards,
 Arnout


>> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> 
>  This is redundant.
> 
>  Regards,
>  Arnout
> 
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +BR2_TARGET_ROOTFS_EXT2_4=y
>> +# BR2_TARGET_ROOTFS_TAR is not set
>>
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
