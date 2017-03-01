From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Mar 2017 21:06:09 +0100
Subject: [Buildroot] test-pkg script can't handle captive portals. etc.
In-Reply-To: <f327db96-a9ce-800a-2419-79166eb9d019@cartelsol.com>
References: <f327db96-a9ce-800a-2419-79166eb9d019@cartelsol.com>
Message-ID: <20170301200609.GC3578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus, All,

On 2017-02-28 21:30 +0100, Marcus Hoffmann spake thusly:
> I just ran into an issue with the test-pkg script.
> When the TOOLCHAINS_URL returns an unexpected result,
> (A router login page, when the Internet got disconnected, a captive
> portal login page, a MITM attack, etc.) the script does weird things and
> outputs something like this:
> 
>     html>: FAILED
> <!DOCTYPE: FAILED
>      HTML: FAILED
>      HTML: ^[ORFAILED
>      EN">:
> [...]

In this situation, I would think that curl will happily return
sucessfuly, so we would not have any hint that the download actually
failed.

For that we would have to inspect the output, and see if that looks like
an actual toolchain list.

I'll see if I can do something about it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
