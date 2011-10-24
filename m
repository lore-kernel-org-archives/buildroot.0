From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 24 Oct 2011 18:42:06 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <20111024173250.7e598d6f@skate>
References: <20111017184718.71afc290@skate> <20111023123755.GA2455@tarshish>
 <20111024173250.7e598d6f@skate>
Message-ID: <201110241842.06558.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 24 October 2011 17:32:50 Thomas Petazzoni wrote:
> Le Sun, 23 Oct 2011 14:37:55 +0200,
> Baruch Siach <baruch@tkos.co.il> a ?crit :
> 
> > 1. Slide 23: missing -e in the 'echo' command
> > 
> > $ echo "/dev/mtdblock7\t\t/applog\tjffs2\tdefaults\t\t0\t0"
> > /dev/mtdblock7\t\t/applog\tjffs2\tdefaults\t\t0\t0
> > 
> > $ echo -e "/dev/mtdblock7\t\t/applog\tjffs2\tdefaults\t\t0\t0"
> > /dev/mtdblock7      /applog jffs2   defaults        0   0
> 
> -e is not needed with sh:

The problem is that /bin/sh might be whatever. With a POSIX-conformant
/bin/sh (eg. dash), this is true. With bash, it is not. Alas, many
systems still have bash as /bin/sh.

$ ls -l /bin/sh
lrwxrwxrwx 1 root root 4 May 17 23:53 /bin/sh -> bash
$ echo "bli\nbla"
bli\nbla
$ /bin/bash
$ echo "bli\nbla"
bli\nbla
$ exit
$ /bin/dash
$ echo "bli\nbla"
bli
bla

The answer it to use printf [0].

I now use printf as much as I can. printf is in POSIX and does not suffer
from all the discrepancies there are in the many echo implementations.

> $ echo "bla\nbli"
> bla
> bli
> $ echo -e "bla\nbli"
> -e bla
> bli

[0] http://pubs.opengroup.org/onlinepubs/9699919799/utilities/printf.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
