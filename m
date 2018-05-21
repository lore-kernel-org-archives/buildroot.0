From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 21 May 2018 17:45:02 +0200
Subject: [Buildroot] [PATCH] package/gcc: add support for gcc 8.1
In-Reply-To: <20180520124507.23c2a29b@windsurf>
References: <20180505105844.5278-1-romain.naour@gmail.com>
 <20180520124507.23c2a29b@windsurf>
Message-ID: <71945c16-5343-400c-01fe-44f1d5cb31c2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 20/05/2018 ? 12:45, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> Thanks for working on this!
> 
> On Sat,  5 May 2018 12:58:44 +0200, Romain Naour wrote:
>> Remove 0860-cilk-fix-build-without-wchar.patch since cilk has
>> been removed from gcc.
>>
>> Rebase 0900-remove-selftests.patch on gcc 8.1.0
>>
>> Remove upstream patches 0001-m68k-coldfire-pr68467.patch and
>> 0892-microblaze-Revert.patch.
>>
>> Use bz2 release tarball only for gcc 4.9 since all other version
>> now use xz tarball.
>>
>> Runtime tested on x86_64 with binutils 2.30, gcc 8.1.0,
>> kernel headers 4.14 and glibc 2.27.
>>
>> Buildtime tested with glibc with all supported architectures.
>>
>> Buildtime tested on x86_64 with musl and uClibc-ng
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> ---
>>  package/gcc/8.1.0/0001-uclibc-conf.patch           |  29 ++++
>>  package/gcc/8.1.0/0002-arm-softfloat-libgcc.patch  |  45 +++++++
>>  package/gcc/8.1.0/0003-remove-selftests.patch      | 149 +++++++++++++++++++++
>>  package/gcc/Config.in.host                         |   7 +
>>  package/gcc/gcc.hash                               |   2 +
>>  package/gcc/gcc.mk                                 |  10 +-
>>  toolchain/Config.in                                |   5 +
>>  .../toolchain-external-custom/Config.in.options    |   6 +
> 
> Could you split up this patch in several patches:
> 
>  - One adding the toolchain/Config.in contents for gcc 8.x
> 
>  - One adding support for gcc 8.x in package/gcc
> 
>  - One adding support for gcc 8.x in toolchain/toolchain-external

Previous gcc bump was done in one patch:

(gcc 7)
https://git.buildroot.net/buildroot/commit/?id=4314161159ce1556e8c14d1d2e22aaf2a8618b82
(gcc 6)
https://git.buildroot.net/buildroot/commit/?id=519d83bfa0442439026db4e71e605a5c1347e566

I wanted to use the same method but ok I'll split this patch if you want.

> 
> It would be good if you could also add a patch to update our default
> gcc version to 7.x.

Ok, this can be done in a followup patch.

> 
> Maybe it's also time to remove gcc 4.9 and gcc 5.x ? I know when gcc
> 7.x was added and we changed to gcc 6.x as the default, we should have
> removed gcc 4.9, but there was some opposition to this. Hopefully we
> can do this removal now ?

See the reply from Arnout and Dagg for gcc 4.9:
http://patchwork.ozlabs.org/patch/767087

I'm not sure that the odroidc2 defconfig is able to build with gcc >= 4.9 since
it's stuck at kernel odroidc2-3.14.y and uboot odroidc2-v2015.01.
Dagg, what do we do for this board?

> 
>> diff --git a/package/gcc/8.1.0/0001-uclibc-conf.patch b/package/gcc/8.1.0/0001-uclibc-conf.patch
>> new file mode 100644
>> index 0000000000..7d0f710945
>> --- /dev/null
>> +++ b/package/gcc/8.1.0/0001-uclibc-conf.patch
>> @@ -0,0 +1,29 @@
>> +From 07475e62626e246df07f35c4427b207c480b1f95 Mon Sep 17 00:00:00 2001
>> +From: Romain Naour <romain.naour@gmail.com>
>> +Date: Tue, 2 May 2017 22:36:15 +0200
>> +Subject: [PATCH 1/3] uclibc-conf
> 
> Use "git format-patch -N" when generating patches to not have numbering
> inside the patches.

Ok, sometime I forgot to add -N when generating a patch series for a package...
I'll fix.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
