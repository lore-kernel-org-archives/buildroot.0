From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Oct 2013 12:23:55 +0200
Subject: [Buildroot] [git commit] toolchain-external: update Linaro ARM
	toolchain
In-Reply-To: <878uy0un36.fsf@dell.be.48ers.dk>
References: <20131009143431.9A85B9B970@busybox.osuosl.org>
 <52564EFD.10506@mind.be> <20131010095744.5690a242@skate>
 <5257BE84.5020901@lucaceresoli.net>
 <CAAXf6LXMvV4rrxbcAozT69PsEVp2CgpgDNhZXnQ6ytdWZz+SvA@mail.gmail.com>
 <20131011112938.16a751d7@skate> <878uy0un36.fsf@dell.be.48ers.dk>
Message-ID: <20131011122355.791e8810@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 11 Oct 2013 12:19:09 +0200, Peter Korsgaard wrote:

>  >> So, this proposal would for example have (fictional)
>  >> Linaro 2012.11 (based on gcc 4.4)
>  >> Linaro 2013.02 (gcc 4.4 but new glibc)
>  >> Linaro 2013.08 (gcc 4.8)
> 
>  Thomas> Ok. So a bit like the Sourcery CodeBench toolchains are updated to
>  Thomas> their latest patch level, but we keep several "major version" with
>  Thomas> their latest patch level.
> 
>  Thomas> But in the case of Sourcery CodeBench toolchain, we do those patch
>  Thomas> level version bumps without changing the Config.in option name, so
>  Thomas> the bump is transparent to users.
> 
>  Thomas> For the Linaro toolchains, the Config.in option name contain the
>  Thomas> precise version. So, what happens when we bump Linaro 2013.08 to Linaro
>  Thomas> 2012.09 (which also uses gcc 4.8, and therefore should replace Linaro
>  Thomas> 2012.08) ?
> 
> If we want to key off gcc version then we should presumably name the
> Config sysmbol similar - E.G.:
> 
> config BR2_TOOLCHAIN_EXTERNAL_LINARY_GCC_4_8
>        bool "Linaro GCC 4.8 (2013.08)"

Problem is that in the example above, Thomas was keying on the gcc
version, or the glibc version. But maybe at some point it's not the gcc
version or glibc version that changed, but the fact that they switched
for EABI to EABIhf.

config BR2_TOOLCHAIN_EXTERNAL_LINARO_VARIANT_1
config BR2_TOOLCHAIN_EXTERNAL_LINARO_VARIANT_2
config BR2_TOOLCHAIN_EXTERNAL_LINARO_VARIANT_3

 ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
