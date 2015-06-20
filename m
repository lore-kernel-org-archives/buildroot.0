From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Jun 2015 11:26:26 +0200
Subject: [Buildroot] [V2 4/4] A20-OLinuXino-Lime: new board (mali)
In-Reply-To: <CAB0FRss5yMY7gnsQU+-t2MZ_Fcxn7ZZ3eocTyqKS4_EyZfcmqQ@mail.gmail.com>
References: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
 <1434741204-3988-5-git-send-email-francois.perrad@gadz.org>
 <55848FB7.6060207@mind.be>
 <CAB0FRss5yMY7gnsQU+-t2MZ_Fcxn7ZZ3eocTyqKS4_EyZfcmqQ@mail.gmail.com>
Message-ID: <558531C2.4040803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/20/15 07:33, Fran?ois Perrad wrote:
> 2015-06-19 23:55 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>> On 06/19/15 21:13, Francois Perrad wrote:
>> [snip]
>>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>>> +BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
>>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
>>> +# based on Linux version 3.4.103
>>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9a1cd034181af628d4145202289e1993c1687db6"
>>
>>  Hey, why did you drop my suggestion to use a github tarball rather than a full
>> git clone?
>>
> 
> I try without success:
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9a1cd034181af628d4145202289e1993c1687db6"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
> github,linux-sunxi,linux-sunxi,9a1cd034181af628d4145202289e1993c1687db6)"

 Ah, sorry, you have to add the source part as well:

BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux-sunxi,linux-sunxi,9a1cd034181af628d4145202289e1993c1687db6)/9a1cd034181af628d4145202289e1993c1687db6.tar.gz"


 BTW looks like this commit is tagged so you can use sunxi-v3.4.104-r0 instead 
of the commit hash.


 Regards,
 Arnout

> 
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ea1ac32bf76eb60baef474c2516fc431b381d952"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call
> github,linux-sunxi,u-boot-sunxi,ea1ac32bf76eb60baef474c2516fc431b381d952)"
> 
> May be, I misunderstood somethings.
> 
> Fran?ois
[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
