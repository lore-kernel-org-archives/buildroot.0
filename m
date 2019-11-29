From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 29 Nov 2019 18:45:43 +0100
Subject: [Buildroot] [PATCH 1/1] configs: add raspberrypi4 64bits
 defconfig
In-Reply-To: <c425434f-f7e9-682d-ea9e-6822aa885e69@smile.fr>
References: <20191129160208.3520611-2-arthur.courtel@smile.fr>
 <c425434f-f7e9-682d-ea9e-6822aa885e69@smile.fr>
Message-ID: <ed919641-0cf7-0f0d-7c5f-8286a0ee785d@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 29/11/2019 ? 18:43, Romain Naour a ?crit?:
> Hi Arthur,
> 
> Le 29/11/2019 ? 17:02, Arthur Courtel a ?crit?:
>> This configuration builds a 64bit image for RaspberryPi 4.
>>
>> Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
>> ---

[...]

>> diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
>> new file mode 100644
>> index 0000000000..3d30fb05f5
>> --- /dev/null
>> +++ b/configs/raspberrypi4_64_defconfig
>> @@ -0,0 +1,24 @@
>> +BR2_aarch64=y
>> +BR2_cortex_a72=y
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
>> +BR2_SYSTEM_DHCP="eth0"
>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
>> +BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay --aarch64"

Here you are using "--add-pi3-miniuart-bt-overlay", have you tested the
Bluetooth interface?

Best regards,
Romain
