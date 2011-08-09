From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 9 Aug 2011 20:56:40 +0200
Subject: [Buildroot] linphone package
In-Reply-To: <87vcu6ig4c.fsf@macbook.be.48ers.dk>
References: <4E413EB9.6040504@fosstel.com> <4E417DC0.3060406@fosstel.com>
 <87vcu6ig4c.fsf@macbook.be.48ers.dk>
Message-ID: <201108092056.40244.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Pedro,

On Tuesday 09 August 2011 20:39:31 Peter Korsgaard wrote:
> >>>>> "Pedro" == Pedro Sanchez <psanchez@fosstel.com> writes:
>  Pedro> I am cross-compiling linphone for ARM and the final executable
>  Pedro> created by buildroot in my target directory is
>  Pedro> /usr/bin/arm-linux-linphonec. No other binaries in the build
>  Pedro> have this "arm-linux' prefix. I's like the binary to be named
>  Pedro> /usr/bin/linphonec instead? Any suggestions?
> 
> Typically you can pass --program-prefix="" to configure to disable it.

Maybe it would make sense to add this to the auto-target infrastructure?
Either it is unconditionally added, or the package can set a variable to
use it, eg. PKG_CONF_PROG_PREFIX = YES

I'll take a shot at it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
