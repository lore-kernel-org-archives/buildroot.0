From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Aug 2018 08:39:07 +0200
Subject: [Buildroot] [PATCH] libssh: fix cross compile with older cmake
In-Reply-To: <87h8jlvjdi.fsf@tkos.co.il>
References: <9dce5a842ebb73937268fa66a3ee699785c5ae7c.1534975110.git.baruch@tkos.co.il>
 <20180822220952.GA9365@scaer> <20180822222719.GB9365@scaer>
 <87h8jlvjdi.fsf@tkos.co.il>
Message-ID: <20180823063907.GC9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-08-23 06:42 +0300, Baruch Siach spake thusly:
> Yann E. MORIN writes:
> > On 2018-08-23 00:09 +0200, Yann E. MORIN spake thusly:
> >> On 2018-08-23 00:58 +0300, Baruch Siach spake thusly:
> >> > Old version of cmake break cross-compilation when FindThreads is used
> >> > because of a try_run call. Add a workaround that avoids try_run.
> >> >
> >> > cmake bug report: https://gitlab.kitware.com/cmake/cmake/issues/16920
> >> >
> >> > Should fix:
> >> > http://autobuild.buildroot.net/results/8aa/8aa2bd894416a4508ca7140f8947ff46243f8b78/
> >> > http://autobuild.buildroot.net/results/f2c/f2cc965bb134bf4fd9e625eb267b67c949c202fc/
> >> >
> >> > Cc: Scott Fan <fancp2007@gmail.com>
> >> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> >> > ---
> >> > Hi Peter, Yann,
> >> >
> >> > Can one of you test this fix on one of the affected autobuilders?
> >> >
> >> >   http://autobuild.buildroot.net/?reason=libssh-0.8.1
[--SNIP--]
> > Here are the results of the configure step, using the config from my
> > autobuilder referenced above, and running 'make libssh-depends' first:
> 
> You meant to say 'make libssh-configure' here, right?

No I meant that I ran:

    $ make libssh-depends
    [...]
    $ make libssh-configure
    [...]

And I only pasted starting with the second command.

> So I reproduced the build failure and the fix with host-cmake here as
> well.

Thanks for finding the issue and fixing it. :-)

[--SNIP--]
> > CMake Warning:
> >   Manually-specified variables were not used by the project:
[--SNIP--]
> >     THREADS_PTHREAD_ARG

I find it weird that THREADS_PTHREAD_ARG is reported as unused, when it
is actually it that fixes the issue... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
