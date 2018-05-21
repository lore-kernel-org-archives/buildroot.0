From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 21 May 2018 21:56:31 +0200
Subject: [Buildroot] [PATCH] arch: drop now useless support for FDPIC
In-Reply-To: <20180521163319.yk5hnvqlb5zgtkv4@tarshish>
References: <20180521161706.3151-1-yann.morin.1998@free.fr>
 <20180521163319.yk5hnvqlb5zgtkv4@tarshish>
Message-ID: <7428B47C-D601-4A51-9193-15B3D0952A71@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
there might be support for sh2 or arm fdpic in the future. Does it harm to keep it?

Binutils arm fdpic is upstream now.

best regards
 Waldemar


> Am 21.05.2018 um 18:33 schrieb Baruch Siach <baruch@tkos.co.il>:
> 
> Hi Yann,
> 
>> On Mon, May 21, 2018 at 06:17:06PM +0200, Yann E. MORIN wrote:
>> Now that we dropped support for blackfin, we no longer have any
>> architecture that supports FDPIC, so BR2_ARCH_HAS_FDPIC_SUPPORT
>> is never selected, so we can't select BR2_BINFMT_FDPIC.
>> 
>> Drop all of that now.
>> 
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> ---
> 
> [snip]
> 
>> # noMMU binary formats
>> -ifeq ($(BR2_BINFMT_FDPIC),y)
>> -define UCLIBC_BINFMT_CONFIG
>> -    $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
>> -    $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
>> -    $(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
>> -    $(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
> 
> Maybe also remove disable of UCLIBC_FORMAT_FDPIC_ELF below? This uClibc config 
> symbol depends on bfin or frv. Both are not supported in Buildroot.
> 
>> -endef
>> -endif
>> ifeq ($(BR2_BINFMT_FLAT_ONE),y)
>> define UCLIBC_BINFMT_CONFIG
>>    $(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
> 
> baruch
> 
> -- 
>     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
