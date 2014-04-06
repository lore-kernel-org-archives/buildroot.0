From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Apr 2014 16:07:16 +0200
Subject: [Buildroot] [PATCH] eudev: Drop patch
 eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13
In-Reply-To: <20140406121545.GA3136@free.fr>
References: <1396705135-4669-1-git-send-email-pmeerw@pmeerw.net>
 <20140406121545.GA3136@free.fr>
Message-ID: <20140406140716.GB3136@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-04-06 14:15 +0200, Yann E. MORIN spake thusly:
> On 2014-04-05 15:38 +0200, Peter Meerwald spake thusly:
> > added by commit 221fd0cd, which basically removes #include <fcntl.h> from a
> > couple of files; it leads to
> > 
> >   CC       accelerometer.o
> > accelerometer.c: In function ?test_orientation?:
> > accelerometer.c:203:9: warning: implicit declaration of function ?open?
> > [-Wimplicit-function-declaration]
> >          fd = open(devpath, O_RDONLY|O_CLOEXEC);
> >          ^
> > accelerometer.c:203:28: error: ?O_RDONLY? undeclared (first use in this function)
> >          fd = open(devpath, O_RDONLY|O_CLOEXEC);
> >                             ^
> > accelerometer.c:203:37: error: ?O_CLOEXEC? undeclared (first use
> > in this function)
> > 
> > the prototype for open() is supposed to be in fnctl.h, hence the #include is
> > needed
> 
> I can confirm this fixes the issue whith my glibc-based toolchain, for
> an ARM platform.

Seems we are not the only ones to struggle with this. Upstream has had
so far three tentatives to fix this issue:

    [1] https://github.com/gentoo/eudev/commit/c5a77c7d10bafac25deca8e3c36946df0dc43071
    [2] https://github.com/gentoo/eudev/commit/974354dee5f5abdea22958c3d57f41d9425f1a8c
    [3] https://github.com/gentoo/eudev/commit/4b76ac0bff27c0a32fc22591ec4543768ae5b991

Patch [1] is the one we currently bundle. I'll do some testing here, and
will spin a patch later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
