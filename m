From: vj <vicencb@gmail.com>
Date: Mon, 24 Aug 2015 23:09:09 +0100
Subject: [Buildroot] [RFC 00/37] efl bump to 1.14.2
In-Reply-To: <55DB8FAF.7060509@openwide.fr>
References: <CAAMcf8CO9XsiTBOJX3APO+ZXtyPLDZmHq2EU0LPT3UXKhTC-=g@mail.gmail.com>
 <55D6F4A8.3000104@openwide.fr>
 <CAAMcf8COScfy62sEC4uPKHw=LgyLWWtic9ypCF0DZMfu21hzdg@mail.gmail.com>
 <55DB8FAF.7060509@openwide.fr>
Message-ID: <CAAMcf8Cp0+p4rG+SYc3EHyQaahBe5M9YrkMMF+Uq0RP+tPJFQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Mon, Aug 24, 2015 at 10:42 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> Hi Vicente
>
> Le 21/08/2015 19:56, vj a ?crit :
>> Hello Romain,
>>
>> On Fri, Aug 21, 2015 at 10:51 AM, Romain Naour <romain.naour@openwide.fr> wrote:
>>> Hi Vicente,
>>>
>>> Le 21/08/2015 02:30, vj a ?crit :
>>>> Hello Romain,
>>>> I've tested you efl update
>>>> https://github.com/RomainNaour/buildroot/tree/efl-1.15.0-v1
>>>> It did not work, :(
>>>> But applying the two patches below works again!
>>>> The first one was already commented in a previous e-mail.
>>>
>>> Yes, sorry I haven't looked at your issue yet.
>>>
>>> libmount seems to be optional and can be disabled with --disable-libmount:
>>> https://github.com/RomainNaour/buildroot/blob/efl-1.15.0-v1/package/efl/efl.mk#L35
>>
>> Without that dependency it failed with 1.14.2.
>> When I saw the dependency was not there in 1.15.0, I just added it
>> again without checking.
>> Just now I've tried it again without that patch and it's fine, so, you
>> can forget it.
>> Sorry for the hassle.
>
> It's ok ;-) I haven't heavily tested with a minimal config.
> Maybe next time can you post the last ~100 build log lines, it not always easy
> to reproduce a build issue...
>
>>
>>>
>>> But since it's not recommended to disable it, I'll apply your patch :)
>>>
>>>> The second is related to a regression in efl-1.15.0.
>>>
>>> Can you report your issue to the efl mailing list ?
>>
>> I know it would be better to have it fixed upstream, but have no time
>> for that now.
>> If you would like to, feel free to report it.
>> To debug it, it helps enabling the WRN and DGB macros in eina_module.c.
>
> Well, I can't really report an issue that I can't reproduce.

Do you mean that the fb backend is working for you?
Are you crosscompiling with upstream vanilla gcc>=4 for arm?
It might be a compiler bug too.
I'm using musl gcc 4.9.3 build with buildroot itself.
gcc 5 seems broken for arm crosscompilation.
Just for completeness, the compiler I'm using was build with:
buildroot.version=2ebbb7fe355c18a0be3d0fb8e50997142113c46b
BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_NEON=y
BR2_HOST_DIR="/opt/arm-buildroot-linux-musleabihf"
BR2_OPTIMIZE_3=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_BINUTILS_VERSION_2_25_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_LTO=y
BR2_GCC_ENABLE_GRAPHITE=y
BR2_TARGET_OPTIMIZATION="-march=armv7-a -mtune=cortex-a8
-mcpu=cortex-a8 -mfpu=neon -mfloat-abi=hard"

> See, I reported the issue about SDL2 dependency and it's now fixed in the efl
> 1.15.1. So, I can drop the last patch and avoid to autoreconf the package.
>
> Also, I'm probably not the good person to report an efl issue.
> Honestly, I don't know what to do with -fvisibility=default.
> It would be better if you can send just an email to the enlightenment mailing
> list to report your issue.

Is "enlightenment-devel at lists.sourceforge.net" the correct mailing
list for an efl bug?

>>
>>>
>>>> The testing I've done has been with the musl libc and with
>>>> BR2_PACKAGE_EFL_RECOMMENDED_CONFIG unset.
>>>> Basically the same config as in the previous e-mail.
>>>>
>>>> A minor issue: check the spelling of recommanded.
>>>
>>> Ha indeed recommanded is used in Config.in prompt
>>> (my French was turned on sorry ;-) )
>>>
>>> Thanks for testing!
>>
>> Thanks for adding musl and maintaining efl!
>
> You're welcome!
>
> Best regards,
> Romain

Regards,
  Vicente.
