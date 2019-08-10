From: daggs <daggs@gmx.com>
Date: Sat, 10 Aug 2019 07:50:08 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: drop odroidc2 from Dagg
 Stompler
In-Reply-To: <p5k02gxd8v.ln2@ID-313208.user.individual.net>
References: <20190804220044.33D7082C8B@busybox.osuosl.org>
 <a931ec3a-ed19-9641-c806-c5b79348700e@smile.fr>
 <p5k02gxd8v.ln2@ID-313208.user.individual.net>
Message-ID: <trinity-06ccea36-f4d9-482d-94d2-0103406d0332-1565416208675@3c-app-mailcom-bs14>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Sent: Friday, August 09, 2019 at 7:38 PM
> From: "Bernd Kuhls" <bernd.kuhls@t-online.de>
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] [git commit] DEVELOPERS: drop odroidc2 from Dagg Stompler
>
> Am Fri, 09 Aug 2019 14:37:48 +0200 schrieb Romain Naour:
>
> > So up to BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_AML is related to the
> > odroidc2 board (from the Buildroot packaging point of view) and should
> > be removed too.
> >
> > Maybe KODI AML support can be used on other AML based board?
>
> Hi,
>
> aml support in Kodi was added by Dagg Stompler with commit
> https://git.buildroot.net/buildroot/commit/package/kodi?
> id=00e7d119ec16cd64f89cb21a2ea715e2bfc3dc73
>
> I am unable to answer your question because I never used Kodi on aml/
> odroid hardware.
>
> Regards, Bernd

as the board was dropped from the support list, I see no reason to keep this. in addition, I think that this board is fully supported without the need for external libs.

the main issue with this board is that latest kernel and uboot from the vendor's site doesn't boot with gcc 7 and the my patches for the main kernel support never got enough replies to advance to a more workable state.
the main issue was the vendor's uboot firmware

I can try revising the patches again and sync them to latest master but as there is no help on how to provide the atf, I see no reason to continue pursuing this.

there are two ways to solve this:
1. continue with my original suggestion, e.g. on image generation, get the vendor's uboot, extract the atf and generate the uboot.
2. provide the atf as part of the board file, still there might be a need get the vendor's uboot to incorporate it into the uboot fw file.

imho, the first option is the right one (less binary files in the tree), the question is what the powers that be think.

Dagg.
