From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Feb 2014 19:53:55 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140207135324.4c7cbe3f@skate>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate>
Message-ID: <20140207185355.GE3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-07 13:53 +0100, Thomas Petazzoni spake thusly:
> >    powerpc |                   weston-1.4.0 | NOK | http://autobuild.buildroot.net/results/aa54b1aaf0ac89531d7a1e7dd3900b35605ae3f5/
> 
>   CC       weston-data-device.o
> launcher-util.c: In function 'setup_tty':
> launcher-util.c:334:38: error: 'K_OFF' undeclared (first use in this function)
> launcher-util.c:334:38: note: each undeclared identifier is reported only once for each function it appears in
> make[4]: *** [libsession_helper_la-launcher-util.lo] Error 1

Too old toolchain.

The K_OFF define was introduced with:
    2011-02-04  9fc3de9c: vt: Add virtual console keyboard mode OFF

which ended up in the 2.6.39 release.

But the freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu
toolchain uses headers from the 2.6.38 Linux kernel, and thus is
missing this define.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
