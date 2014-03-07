From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Mar 2014 18:21:21 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
In-Reply-To: <CAHkwnC9tLUTAVHnGNyPkPxNFFFMTiqPyAvhtahGEWZAPbY0BgQ@mail.gmail.com>
References: <CAHkwnC9NzMx8kE4KdBjnAys7Xj5n0sQS6AHa=ZrzLqQQtkFZUg@mail.gmail.com>
 <20140306213113.GH3625@free.fr>
 <CAHkwnC9tLUTAVHnGNyPkPxNFFFMTiqPyAvhtahGEWZAPbY0BgQ@mail.gmail.com>
Message-ID: <20140307172121.GC3384@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-03-07 10:59 +0100, Fabio Porcedda spake thusly:
> On Thu, Mar 6, 2014 at 10:31 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2014-03-06 11:43 +0100, Fabio Porcedda spake thusly:
> >> Hi all,
> >> luajit fails to build on a Ubuntu 13.10 x86_64 with the following defconfig:
> >>
> >> BR2_x86_generic=y
> >> BR2_TOOLCHAIN_EXTERNAL=y
> >> BR2_PACKAGE_LUAJIT=y
[--SNIP--]
> > And this can not work on a pure 64-bit system (aka, without the 32-bit
> > legacy stuff).
[--SNIP--]
> > Not sure how we can get away with this...
> 
> I think we have two choices:
>  - add a check to test if 32bit compiler is installed and if not print
> a clear message about the toolchain requirement

I think this would be the first package to add such a check.

How would you propose we implement this:
  - in a pre-configure hook (but that will catch the failure late in the
    build) ?
  - in a make ifeq-block (so we can catch it early in the build) ?

The second solution is more appealing to me, but might be a bit more
complex to implement.

>  - add (BR2_i386 && BR2_HOSTARCH='i386') to the config.in to exlude
> such combination.

But that would prevent the combination on systems that are setup with
support for building 32-bit programs, which is a pity...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
