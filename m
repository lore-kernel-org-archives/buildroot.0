From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Jan 2016 15:14:36 +0100
Subject: [Buildroot] [RFC 2/2] remove download suppression from mke2img
 and skeleton
In-Reply-To: <20160119223334.GI3360@free.fr>
References: <39cc9541d430e29d38dc07ef2c1d975687cf2af3.1443645945.git.alex.suykov@gmail.com>
 <1b24de4a1afafff779eebb3cbe551dc18f8a2993.1443645945.git.alex.suykov@gmail.com>
 <20160119223334.GI3360@free.fr>
Message-ID: <CAAXf6LVDeQLa+NFb5P_HPdh_wbEvv60F59v=suCSsGbcCM=WKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 19, 2016 at 11:33 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Alex, All,
>
> On 2015-10-01 00:13 +0300, Alex Suykov spake thusly:
>> With non-versioned packages patch applied, there is no need
>> to set empty _SOURCE.
>>
>> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
>
> After the previous patch has been applied:
>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>
>> ---
>>  package/mke2img/mke2img.mk   | 1 -
>>  package/skeleton/skeleton.mk | 3 ---
>>  2 files changed, 4 deletions(-)
>>
>> diff --git a/package/mke2img/mke2img.mk b/package/mke2img/mke2img.mk
>> index 04aaa8f..9de387a 100644
>> --- a/package/mke2img/mke2img.mk
>> +++ b/package/mke2img/mke2img.mk
>> @@ -4,7 +4,6 @@
>>  #
>>  ################################################################################
>>
>> -HOST_MKE2IMG_SOURCE =
>>  HOST_MKE2IMG_DEPENDENCIES = host-genext2fs host-e2fsprogs
>>
>>  define HOST_MKE2IMG_INSTALL_CMDS
>> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
>> index 48e7085..c182b54 100644
>> --- a/package/skeleton/skeleton.mk
>> +++ b/package/skeleton/skeleton.mk
>> @@ -4,9 +4,6 @@
>>  #
>>  ################################################################################
>>
>> -# source included in buildroot
>> -SKELETON_SOURCE =
>> -
>>  # The skeleton can't depend on the toolchain, since all packages depends on the
>>  # skeleton and the toolchain is a target package, as is skeleton.
>>  # Hence, skeleton would depends on the toolchain and the toolchain would depend
>

Question is whether it is correct that mke2img and skeleton are unversioned.
Packages that are similar are makedevs, mkpasswd and getent, where the
_VERSION is explicitly set to match the Buildroot version:
MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
I think that mke2img is in the same boat as these packages, and so
should follow the same strategy.

/Thomas
