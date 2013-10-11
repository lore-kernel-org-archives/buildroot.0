From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Oct 2013 13:40:40 +0200
Subject: [Buildroot] [git commit] toolchain-external: update Linaro ARM
	toolchain
In-Reply-To: <20131011122355.791e8810@skate>
References: <20131009143431.9A85B9B970@busybox.osuosl.org>
 <52564EFD.10506@mind.be> <20131010095744.5690a242@skate>
 <5257BE84.5020901@lucaceresoli.net>
 <CAAXf6LXMvV4rrxbcAozT69PsEVp2CgpgDNhZXnQ6ytdWZz+SvA@mail.gmail.com>
 <20131011112938.16a751d7@skate> <878uy0un36.fsf@dell.be.48ers.dk>
 <20131011122355.791e8810@skate>
Message-ID: <CAAXf6LVKr0DPT1U2GuTqdSGAyMGEAdDGF6Uo0PYeb4gGLmg9wQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 11, 2013 at 12:23 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Peter Korsgaard,
>
> On Fri, 11 Oct 2013 12:19:09 +0200, Peter Korsgaard wrote:
>
>>  >> So, this proposal would for example have (fictional)
>>  >> Linaro 2012.11 (based on gcc 4.4)
>>  >> Linaro 2013.02 (gcc 4.4 but new glibc)
>>  >> Linaro 2013.08 (gcc 4.8)
>>
>>  Thomas> Ok. So a bit like the Sourcery CodeBench toolchains are updated to
>>  Thomas> their latest patch level, but we keep several "major version" with
>>  Thomas> their latest patch level.
>>
>>  Thomas> But in the case of Sourcery CodeBench toolchain, we do those patch
>>  Thomas> level version bumps without changing the Config.in option name, so
>>  Thomas> the bump is transparent to users.
>>
>>  Thomas> For the Linaro toolchains, the Config.in option name contain the
>>  Thomas> precise version. So, what happens when we bump Linaro 2013.08 to Linaro
>>  Thomas> 2012.09 (which also uses gcc 4.8, and therefore should replace Linaro
>>  Thomas> 2012.08) ?
>>
>> If we want to key off gcc version then we should presumably name the
>> Config sysmbol similar - E.G.:
>>
>> config BR2_TOOLCHAIN_EXTERNAL_LINARY_GCC_4_8
>>        bool "Linaro GCC 4.8 (2013.08)"
>
> Problem is that in the example above, Thomas was keying on the gcc
> version, or the glibc version. But maybe at some point it's not the gcc
> version or glibc version that changed, but the fact that they switched
> for EABI to EABIhf.
>
> config BR2_TOOLCHAIN_EXTERNAL_LINARO_VARIANT_1
> config BR2_TOOLCHAIN_EXTERNAL_LINARO_VARIANT_2
> config BR2_TOOLCHAIN_EXTERNAL_LINARO_VARIANT_3
>

Looking at the linaro download page and the names of the tarballs,
they do co-name their toolchains with the gcc version, at least since
2013.

gcc-linaro-armeb-linux-gnueabihf-4.8-2013.09_linux.tar.xz
gcc-linaro-arm-linux-gnueabihf-4.7-2013.04-20130415_linux.tar.xz

So, naming the config options like that may not be such a wild idea after all.

Of course, we still have to decide whether we want gcc 4.8, 4.7, and
4.6, or rather larger jumps like
gcc 4.8, 4.4, 4.0 or something like that.

Best regards,
Thomas
