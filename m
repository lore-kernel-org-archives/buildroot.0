From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 18 Apr 2015 10:28:31 -0400
Subject: [Buildroot] [PATCH 3/3] altera: update use of
	BR2_TARGET_UBOOT_PATCH_DIR
In-Reply-To: <20150418155541.55f356cb@free-electrons.com>
References: <1429302375-12275-1-git-send-email-fhunleth@troodon-software.com>
 <1429302375-12275-3-git-send-email-fhunleth@troodon-software.com>
 <20150418155541.55f356cb@free-electrons.com>
Message-ID: <CA+-urNRRAEeDp23bzrrh7tR1UFB2OXTpydgSu6P2+_LPBsZKMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 18, 2015 at 9:55 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Frank Hunleth,
>
> On Fri, 17 Apr 2015 16:26:15 -0400, Frank Hunleth wrote:
>> Use BR2_TARGET_UBOOT_PATCHES now that BR2_TARGET_UBOOT_PATCH_DIR is
>> deprecated.
>>
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>> ---
>>  configs/altera_sockit_defconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
>> index d27b96b..f9249ca 100644
>> --- a/configs/altera_sockit_defconfig
>> +++ b/configs/altera_sockit_defconfig
>> @@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
>>  BR2_TARGET_UBOOT_CUSTOM_GIT=y
>>  BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.rocketboards.org/u-boot-socfpga.git"
>>  BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_acds13.0sp1"
>> -BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/altera/sockit"
>> +BR2_TARGET_UBOOT_CUSTOM_PATCHES="board/altera/sockit/uboot-sockit-preloader-sample-design.patch"
>
> Did you actually tested this? It will end up with:
>
> UBOOT_PATCH = board/altera/sockit/uboot-sockit-preloader-sample-design.patch
>
> which means that the package infra will try to download:
>
>    ftp://ftp.denx.de/pub/u-boot/board/altera/sockit/uboot-sockit-preloader-sample-design.patch
>
> No?

Dohh! In my rush to leave yesterday, I had convinced myself that it
would work without testing. You're totally right, though. I'll fix
depending on how the first patch in the series works out.

Thanks,
Frank

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
