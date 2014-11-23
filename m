From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 16:23:54 +0100
Subject: [Buildroot] [PATCH v4 2/4] bdwgc: new package
In-Reply-To: <546E6154.6090509@paguilar.org>
References: <1415310486-25904-1-git-send-email-paguilar@paguilar.org>
 <1415310486-25904-3-git-send-email-paguilar@paguilar.org>
 <20141118205903.GJ4333@free.fr> <546E6154.6090509@paguilar.org>
Message-ID: <20141123152354.GA4210@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

On 2014-11-20 22:47 +0100, Pedro Aguilar spake thusly:
> On 18/11/2014 21:59, Yann E. MORIN wrote:
> >Pedro, All,
> >
> >On 2014-11-06 22:48 +0100, Pedro Aguilar spake thusly:
> >>bdwgc is a garbage collector for C and C++. The Boehm-Demers-Weiser
> >>conservative garbage collector can be used as a garbage collecting
> >>replacement for C 'malloc' or C++ 'new'.
> >>
> >>Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> >
> >I've had a cursory look at configure.ac, and it seems it detects C++ and
> >threading model, and does not need LFS.
> 
> It installs C++ support only with the --enable-cplusplus option that is not
> enabled by default and not needed by Guile.
> 
> Yes, it detects a threading model depending on the platform.
> Should I add to the Config.in the following?
> 
> comment "bdwgc needs a toolchain w/ threads"
>     depends on BR2_TOOLCHAIN_HAS_THREADS

No, that's Ok as-is, because configure detects the presence or abscence
of C++ and threads, so we need not depend on _HAS_THREADS or anything
else.

If that was wrong, the autobuilders will tell us, since they build a lot
of different combinations.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
