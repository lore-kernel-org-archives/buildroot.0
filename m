From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 6 Oct 2010 23:25:09 +0200
Subject: [Buildroot] nptl depends on uclibc
In-Reply-To: <4CACDCA0.1040103@daccii.it>
References: <4CACDCA0.1040103@daccii.it>
Message-ID: <201010062325.09407.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniele, All,

On Wednesday 06 October 2010 22:31:28 Daniele Salvatore Albano - Lavoro wrote:
> i'm trying to setup a development system using ct-ng with eglibc but, 
> while configuring stuff, i've seen that only linuxthreads and 
> linuxthreads old are usable and not nptl.
> Looking at configuration file i've seen that there is a depends on 
> uclibc snapshot.
> Is this correct? NPTL should be default, or, however, should be 
> selectable when using eglibc and when using glibc.

This is a known issue. There is currently no way to tell buildroot that an
external toolchain is using NPTL.

There has been a discussion about in in the recent past, but I can't recall
what was the outcome...

Basically, buildroot should not have to know what threading implementation
is being used, as it has no partical user-visible impact. There are currently
only two packages that have dependency on NPTL: openvpn and ltp. For others,
you should be able to safely use an NPTL toolchain without telling buildroot.

I'll look into that during the WE, hopefully.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
