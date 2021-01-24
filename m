From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 10:40:18 +0100
Subject: [Buildroot] [PATCH 0/3] package/sysklogd: version bump,
 some fixes, and more menuconfig
In-Reply-To: <20210122154333.1927190-1-troglobit@gmail.com>
References: <20210122154333.1927190-1-troglobit@gmail.com>
Message-ID: <20210124094018.GK926565@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joachim, All,

On 2021-01-22 16:43 +0100, Joachim Wiberg spake thusly:
> Hi!
> 
> This series bumps sysklogd to the latest version, fixes an issue with
> fetching from GitHub (release tarballs exist), and finally adds some
> menuconfig options enabling the native logger tool and controlling
> the back-off time for unreachable remote syslog servers.
> 
> Cheers
>  /Joachim
> 
> Joachim Wiberg (3):
>   package/sysklogd: bump to verson 2.2.0
>   package/sysklogd: add menuconfig support for enabling native logger
>   package/sysklogd: menuconfig support for remote syslog retry delay

All three patches applied to master, thanks.

Please review my comments and rework on patch 1. I also slightly
reworked patch 2 to use the more traditional ifew-else-endif block
rather than the $(if) construct.

Thanks!

Regards,
Yann E. MORIN.

>  ...RCE_required_for_O_CLOEXEC_on_uClibc.patch | 44 -------------------
>  package/sysklogd/Config.in                    | 30 +++++++++++++
>  package/sysklogd/sysklogd.hash                |  2 +-
>  package/sysklogd/sysklogd.mk                  | 12 ++---
>  package/sysklogd/syslogd.service              |  3 +-
>  5 files changed, 40 insertions(+), 51 deletions(-)
>  delete mode 100644 package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch
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
