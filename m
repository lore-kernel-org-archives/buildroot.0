From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Nov 2019 18:55:35 +0100
Subject: [Buildroot] [PATCH] umtprd: Add package
In-Reply-To: <20191107170506.rg3bav5gflvestqf@sapphire.tkos.co.il>
References: <20191107164513.5760-1-paul@crapouillou.net>
 <20191107170506.rg3bav5gflvestqf@sapphire.tkos.co.il>
Message-ID: <20191107175535.GB3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2019-11-07 19:05 +0200, Baruch Siach spake thusly:
> On Thu, Nov 07, 2019 at 05:45:13PM +0100, Paul Cercueil wrote:
> > uMTP-Responder is a lightweight USB Media Transfer Protocol (MTP)
> > responder daemon for GNU/Linux.
[--SNIP--]
> > ++#include <pthread.h>
> This most likely means ...
> > +config BR2_PACKAGE_UMTPRD
> > +	bool "umtprd"
> ... that the package needs to depend on BR2_TOOLCHAIN_HAS_THREADS?

It also needs kernel headers >= 3.15 (for FUNCTIONFS_HAS_FS_DESC and
FUNCTIONFS_HAS_HS_DESC in functionfs.h)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
