From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 21:46:55 +0100
Subject: [Buildroot] [PATCH 0/6] package/mrouted: bump version and
 improve integration
In-Reply-To: <20210123103155.2599311-1-troglobit@gmail.com>
References: <20210123103155.2599311-1-troglobit@gmail.com>
Message-ID: <20210123204655.GB926565@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joachim, All,

On 2021-01-23 11:31 +0100, Joachim Wiberg spake thusly:
> Hi! :)
> 
> This series updates mrouted to the latest version[1], verifies that the
> kernel config actually has multicast routing enabled, adds the missing
> SysV init script, and replaces the hard-coded enabling of RSRR support
> with a menuconfig option.  RSRR really is experimental and should not be
> enbled by default.
> 
> Best regards
>  /Joachim
> 
> [1]: Release notes; https://github.com/troglobit/mrouted/releases/tag/4.2
> 
> Joachim Wiberg (6):
>   package/mrouted: bump to version 4.2
>   package/mrouted: ensure multicast routing is enabled in kernel
>   package/mrouted: update description a bit, mention oper. requirement
>   package/mrouted: add sysv init script

Patches 1-4 applied, thanks.

>   package/mrouted: for merged usr, install to /usr by default, not /

I have concerns and questions about that one, so I'll reply individually
to it.

>   package/mrouted: menuconfig support for enabling rsrr support

Applied too, but I will also comment on it.

Regards,
Yann E. MORIN.

>  package/mrouted/Config.in    | 18 +++++++++++
>  package/mrouted/S41mrouted   | 62 ++++++++++++++++++++++++++++++++++++
>  package/mrouted/mrouted.hash |  6 ++--
>  package/mrouted/mrouted.mk   | 15 +++++++--
>  4 files changed, 96 insertions(+), 5 deletions(-)
>  create mode 100755 package/mrouted/S41mrouted
> 
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
