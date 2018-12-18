From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Dec 2018 20:51:57 +0100
Subject: [Buildroot] [PATCH v2] package: dropbear: make PATH configurable
In-Reply-To: <533843879.18165671.1545090256285.JavaMail.zimbra@datacom.com.br>
References: <20180309224149.20225-1-mmayer@broadcom.com>
 <20181216152603.GD2384@scaer>
 <533843879.18165671.1545090256285.JavaMail.zimbra@datacom.com.br>
Message-ID: <20181218195157.GG24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-12-17 21:44 -0200, Carlos Santos spake thusly:
> Notice that /bin and /sbin are redundant with their /usr counterparts for
> BR2_ROOTFS_MERGED_USR=y.
[--SNIP--]
> In one of my current projects there is a /etc/profile.d/path.sh file in a
> rootfs overlay containing
>    #!/bin/sh
>    PATH="$(test -L /bin || echo /bin:)$(test -L /sbin || echo /sbin:)/usr/bin:/usr/sbin"

On the other hand, and as I replied to Markus in his new iteration, is
the overhead to search in PATH so huge it needs this micro-optimisation?

If the commands are in /usr/bin, does it matter they are primarily found
in /bin instead? They are the same commands to begin with, so...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
