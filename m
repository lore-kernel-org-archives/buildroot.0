From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 11:29:52 +0200
Subject: [Buildroot] [PATCH 00/10] Misc CVE ignores
In-Reply-To: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
References: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210424092952.GS298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2021-04-21 15:42 -0500, Matt Weber spake thusly:
>  * I'm working on upstream NVD fixes for some of these.
> 
>  * There are roughly half of the ignore cases that are a bit of a
>    challenge to identify where the fix was clearly tracked into
>    a specific version. I tried to document in each commit as much
>    as a could by linking to conversations clarifying the details.
> 
> Matt Weber (10):
>   package/bind: ignore CVE-2017-3139
>   package/coreutils: ignore CVE-2013-0221, CVE-2013-0222, CVE-2013-0223
>   package/bind: ignore CVE-2019-6470
>   package/cmake: ignore CVE-2016-10642
>   package/flex: ignore CVE-2019-6293

For this one, I've switched to using the actual upstream URL, rather
that of a downstream consumer:
    https://github.com/westes/flex/issues/414

>   package/hostapd: ignore CVE-2021-30004 when using openssl
>   package/wpa_supplicant: ignore CVE-2021-30004 when using openssl
>   package/ncurses: ignore CVE-2018-10754, CVE-2018-19211,
>     CVE-2018-19217, CVE-2019-17594, CVE-2019-17595
>   package/rsyslog: ignore CVE-2015-3243
>   package/tar: ignore CVE-2007-4476

Series applied to master, thanks.

Regards,
Yann E. MORIN.

>  package/bind/bind.mk                     | 4 ++++
>  package/cmake/cmake.mk                   | 2 ++
>  package/coreutils/coreutils.mk           | 4 ++++
>  package/flex/flex.mk                     | 3 +++
>  package/hostapd/hostapd.mk               | 2 ++
>  package/ncurses/ncurses.mk               | 6 ++++++
>  package/rsyslog/rsyslog.mk               | 4 ++++
>  package/tar/tar.mk                       | 2 ++
>  package/wpa_supplicant/wpa_supplicant.mk | 2 ++
>  9 files changed, 29 insertions(+)
> 
> -- 
> 2.17.1
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
