From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 20 Jun 2015 07:33:53 +0200
Subject: [Buildroot] [V2 4/4] A20-OLinuXino-Lime: new board (mali)
In-Reply-To: <55848FB7.6060207@mind.be>
References: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
 <1434741204-3988-5-git-send-email-francois.perrad@gadz.org>
 <55848FB7.6060207@mind.be>
Message-ID: <CAB0FRss5yMY7gnsQU+-t2MZ_Fcxn7ZZ3eocTyqKS4_EyZfcmqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-06-19 23:55 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
> On 06/19/15 21:13, Francois Perrad wrote:
> [snip]
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
>> +# based on Linux version 3.4.103
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9a1cd034181af628d4145202289e1993c1687db6"
>
>  Hey, why did you drop my suggestion to use a github tarball rather than a full
> git clone?
>

I try without success:
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9a1cd034181af628d4145202289e1993c1687db6"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,linux-sunxi,linux-sunxi,9a1cd034181af628d4145202289e1993c1687db6)"

-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ea1ac32bf76eb60baef474c2516fc431b381d952"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call
github,linux-sunxi,u-boot-sunxi,ea1ac32bf76eb60baef474c2516fc431b381d952)"

May be, I misunderstood somethings.

Fran?ois

>
>> +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
>> +BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
>> +
>> +# sunxi packages
>> +BR2_PACKAGE_SUNXI_TOOLS=y
>> +BR2_PACKAGE_SUNXI_BOARDS=y
>> +BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/a20-olinuxino_lime.fex"
>> +
>> +# Bootloaders
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime"
>> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
>> +BR2_TARGET_UBOOT_VERSION="sunxi"
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
>> +# based on U-Boot 2014.04
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ea1ac32bf76eb60baef474c2516fc431b381d952"
>
>  Here as well.
>
>
>  Regards,
>  Arnout
>
>> +BR2_TARGET_UBOOT_FORMAT_BIN=y
>> +BR2_TARGET_UBOOT_SPL=y
>> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>> +
>> +# Additional tools
>> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
