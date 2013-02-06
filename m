From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Feb 2013 23:15:45 +0100
Subject: [Buildroot] bug report: c++ programs built by toolchain crash
	by seg fault
In-Reply-To: <20130205084502.6b370422@skate>
References: <CAJXWAwwHVddYF3StQByTW99aCDksiAwyOa_WdM7AbjGu3i6iJg@mail.gmail.com>
 <20130205084502.6b370422@skate>
Message-ID: <201302062315.45684.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hayate, All,

On Tuesday 05 February 2013 Thomas Petazzoni wrote:
> On Tue, 5 Feb 2013 14:24:55 +0800, hayate wrote:
> > arm little endian; generic arm; OABI; gcc 4.6.3 with c++ support;
> > uclibc 0.9.31.1
> 
> Can you test with EABI?
> 
> Really OABI is deprecated. It would not be surprising at all that there
> are issues with OABI.

What I would suggest when using technologies of the previous millenium, is
to use tools dating from the same era. Use a combo of {binutils,gcc,libc}
that were current at that time to build your toolchain.

Then, use that toolchain as an external toolchain for Buildroot.

Note however that, using too old components might not be possible either,
as Buildroot expects a toolchain with a sysroot, which is not something
that was available with now-very-old components.

YMMV, as they say.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
