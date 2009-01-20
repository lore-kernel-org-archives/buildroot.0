From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 20 Jan 2009 07:27:38 +0100
Subject: [Buildroot] Status of "mplayer" in buildroot
In-Reply-To: <1232395188.4539.20.camel@elrond.atmel.com>
References: <1232395188.4539.20.camel@elrond.atmel.com>
Message-ID: <20090120072738.77f10839@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Jan 2009 20:59:47 +0100
Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:

> Anyone beeing able to build "mplayer" at all?
> 
> I have been trying to get that to build for some time now.
> 
> There are several problems:
> 
> 1: Current mplayer relies on an older version of alsa-lib
>    The current version of alsa-lib make some routines "local"
>    by statements like:
> 
>    #define snd_XXXX snd1_XXXX
> 
>    mplayer uses some of these routines and the build will not
> complete.
> 

I added a patch to the repository to fix compilation against the new
alsa library. MPlayer compiles and runs again :) Tested only on AVR32.

> 2) mplayer do not have any recent "versions".
>    Instead you are encouraged to checkout the latest svn.
> 

It is just plain bad to depend on a random checkout. Perhaps we can use
debians/ubuntus "release"?

MPlayer v1.0rc2 + mplayer_1.0~rc2-0ubuntu17.diff.gz ?

When I look more into it, the Ubuntu diff is just adding pulse audio
support and various version and other doc changes.

>    The build of this will fail using the current Buildroot mplayer.mk,
>    since you have to prepare the mplayer source tree by:
> 
>    ./configure
>    make codec.conf.h	# This is created using native gcc.
> 
>    And once this is complete, then the buildroot mplayer.mk
>    can be applied on top.
> 
>    The AVR32 patches do not apply clean on the current svn, but
>    since I believe mplayer do not build anyway, for any architecture
>    that means that there should be no problem upgrading mplayer 
>    to the latest version.
> 
>    I *have* created a new version of the AVR patches that applies
>    clean on top of the current svn. Not fully tested yet.
>    HCE you want to test?
>

Sure, feel free to send me the diff, then I can work on getting it
ready for submission upstream.

> I am not particlary fond of downloading the latest svn,
> since that is a recipy for breakage.
> I think we should have a recommended version of mplayer
> (which we have tested on many architectures) 
> as well as the capability to checkout the latest.
> 

I say we at least move to v1.0rc2, but lets worry about that after the
release. The quick fix I did should get it working as it is now.

-- 
Best regards,
Hans-Christian Egtvedt
