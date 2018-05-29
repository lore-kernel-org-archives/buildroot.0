From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 29 May 2018 14:48:28 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <42437f2b-2d35-fa5c-c695-fb29031c8cc9@smile.fr>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <42437f2b-2d35-fa5c-c695-fb29031c8cc9@smile.fr>
Message-ID: <21070c46-b413-c412-0272-fd1708b66d31@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I missed the second mail...

Le 29/05/2018 ? 14:39, Romain Naour a ?crit?:
> Hi Christophe,
> 
> Le 29/05/2018 ? 14:09, Christophe PRIOUZEAU a ?crit?:
>> Due to runtime issue with the usage of BINUTILS 2.29.x,
>> we need to use the version 2.28.x
>>
>> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>

Fixes: #11051

Acked-by: Romain Naour <romain.naour@smile.fr>

>> ---
>>  configs/stm32f429_disco_defconfig | 1 +
> 
> Thanks for the patch!
> 
> The defconfig stm32f469_disco is also affected by this issue.
> Binutils version must be updated as well.
> 
> Best regards,
> Romain
> 
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
>> index 5237e9a..fc167d0 100644
>> --- a/configs/stm32f429_disco_defconfig
>> +++ b/configs/stm32f429_disco_defconfig
>> @@ -2,6 +2,7 @@ BR2_arm=y
>>  BR2_cortex_m4=y
>>  BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
>>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
>> +BR2_BINUTILS_VERSION_2_28_X=y
>>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
>>  BR2_LINUX_KERNEL=y
>>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
