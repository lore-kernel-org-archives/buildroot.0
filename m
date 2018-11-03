From: Carlos Santos <casantos@datacom.com.br>
Date: Sat, 3 Nov 2018 00:20:06 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] fs: allow filesystems to set the name of
 their output file
In-Reply-To: <20181101210103.GX28575@scaer>
References: <20181024143616.GA31663@scaer>
 <20181025002043.2235-1-casantos@datacom.com.br>
 <20181101210103.GX28575@scaer>
Message-ID: <400754389.13590.1541211606004.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann Morin" <yann.morin.1998@free.fr>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Quinta-feira, 1 de novembro de 2018 18:01:03
> Subject: Re: [PATCH v2] fs: allow filesystems to set the name of their output file

> Carlos, All,
> 
> On 2018-10-24 21:20 -0300, Carlos Santos spake thusly:
>> Some filesystems may want to tweak their output names, rather than using
>> the fixed "rootfs.foo" scheme. Add a ROOTFS_FOO_IMAGE_NAME variable for
>> this purpose.
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
>> ---
>> Supersedes: https://patchwork.ozlabs.org/patch/988446/
>> 
>> Changes v1->v2:
>> - Prevent leading space when the filesystem gets 'imaginative', as
>>   pointed by Yann Morin.
>> 
>> NOTE: https://patchwork.ozlabs.org/patch/927116/ must be upated to
>> document this.
>> ---
>>  fs/common.mk | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>> 
>> diff --git a/fs/common.mk b/fs/common.mk
>> index 453da6010a..9c2f9c6dd4 100644
>> --- a/fs/common.mk
>> +++ b/fs/common.mk
>> @@ -106,6 +106,8 @@ rootfs-common-show-depends:
>>  # all variable references except the arguments must be $$-quoted.
>>  define inner-rootfs
>>  
>> +ROOTFS_$(2)_IMAGE_NAME ?= rootfs.$(1)
>> +ROOTFS_$(2)_FINAL_IMAGE_NAME = $$(call qstrip,$$(ROOTFS_$()_IMAGE_NAME))
>                                                           ^^^
> 
> This patch has not been tested at all, it can't even possibly work...

Pfff, I will send a follow-up fixing that. Sorry.

Scratching my head attempting to find how it happened.

[Mental note: stay away from recreational substances while at work].

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
