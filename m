From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 May 2019 16:29:17 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_63261
In-Reply-To: <20190529155936.6b61692f@windsurf.home>
References: <20190529135341.23842-1-giulio.benetti@micronovasrl.com>
 <20190529135341.23842-2-giulio.benetti@micronovasrl.com>
 <20190529155936.6b61692f@windsurf.home>
Message-ID: <f7870ce7-56f9-ce83-37c7-4d6cf125eafa@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 29/05/2019 15:59, Thomas Petazzoni ha scritto:
> Hello Giulio,
> 
> Thanks for all this work on Microblaze toolchain bugs!

It's a pleasure and this allows me to lear a lot starting from the base 
thanks to you all :)

> On Wed, 29 May 2019 15:53:39 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
>> +# longer exists in gcc 8.x.
>> +config BR2_TOOLCHAIN_HAS_GCC_BUG_63261
>> +	bool
>> +	default y if BR2_microblaze
>> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> 
> If I understand correctly, this bug only triggers when
> BR2_ENABLE_DEBUG=y, so this option should have a:
> 
> 	depends on BR2_ENABLE_DEBUG
> 
> perhaps ?

Oops, yes I've forgotten it, thanks for pointing me that.

> Semantically, the toolchain is indeed always affected by bug 63261, but
> it only manifests itself when BR2_ENABLE_DEBUG=y, and it's easier to
> have this information in one place (where
> BR2_TOOLCHAIN_HAS_GCC_BUG_63261) rather than in each package.

Yes, I'm going to write this ^^^ in cover letter on v2 patchset.

Thanks
Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
