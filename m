From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 19:40:27 +0100
Subject: [Buildroot] [PATCH 0/2] autotools: do not overwrite first
 include path
In-Reply-To: <87y2tdv7ev.fsf@dell.be.48ers.dk>
References: <20200204124013.17340-1-heiko.thiery@gmail.com>
 <20200204131300.GD3101@scaer> <87y2tdv7ev.fsf@dell.be.48ers.dk>
Message-ID: <20200208184027.GB5156@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-02-08 08:56 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Heiko, All,
>  > On 2020-02-04 13:40 +0100, Heiko Thiery spake thusly:
>  >> The first patch fixes the issue with the autotools package.
>  >> For a detailed explanation take a look into the commit message.
>  >> 
>  >> The second patch removes the hooks that were introduced to workaround
>  >> the issue that is fixed with the first patch.
>  >> 
>  >> Heiko Thiery (1):
>  >> remove the hook for creating the m4 directory
>  >> 
>  >> Michael Walle (1):
>  >> autotools: do not overwrite first include path
> 
>  > Series applied to master, thanks! :-)
> 
>  > I just slightly reword the commit logs with a little bit of extra
>  > details.
> 
> It unfortunately seems to cause some breakage :/
> 
> E.G. sdl_mixer fails with an autools-related issues since this got
> applied:
> 
> libtool: Version mismatch error.  This is libtool 2.4.6, but the
> libtool: definition of this LT_INIT comes from libtool 2.2.6.
> libtool: You should recreate aclocal.m4 with macros from libtool 2.4.6
> libtool: and run autoconf again.
> 
> http://autobuild.buildroot.net/?reason=sdl_mixer-1.2.12
> 
> Care to take a look?

Patch on the list. I'll test sdl2_mixer now, it should have the same
issue, since that code has not changed from the 1.2 era (even if our
autobuilders do not yet report a single failure...).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
