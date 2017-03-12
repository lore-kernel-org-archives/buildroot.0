From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 11:21:22 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-11
In-Reply-To: <20170312072850.B4CA8207D4@mail.free-electrons.com>
References: <20170312072850.B4CA8207D4@mail.free-electrons.com>
Message-ID: <20170312102122.GA3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2017-03-12 08:28 +0100, Thomas Petazzoni spake thusly:
> Detail of failures
>          arm |              firejail-0.9.44.8 | NOK | http://autobuild.buildroot.net/results/7449c5d8b36528749ab2df929cf6a08eb0bdc3b1

    In file included from protocol.c:50:0:
    seccomp.h:76:27: fatal error: linux/seccomp.h: No such file or directory

And this is not unexpected: it does not cross-compile... :-(

    cc [...] -c protocol.c -o protocol

It is using 'c'' while this is an ARM build, so definitely a no-no...

I'll fix that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
