From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 10:57:47 +0100
Subject: [Buildroot] [PATCH 0/3] NSPR cleanup
In-Reply-To: <20191227144324.84759-1-giulio.benetti@benettiengineering.com>
References: <20191227144324.84759-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191229095747.GW26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2019-12-27 15:43 +0100, Giulio Benetti spake thusly:
> This patchset makes libnspr available for every architecture, before
> Xtensa and Arc architectures were not supported. By doing this we can then
> remove additional check in Config.in files with
> 'depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT' that becomes useless.
> 
> Giulio Benetti (3):
>   package/libnspr: allow building for Arc Architecture

I've applied that one...

>   package/libnspr: enable building with xtensa
>   package/libnspr: remove BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT

.. but those two ones are a feature patch. Let's at least wait for
upstream to reply/apply it before we can carry it. As such, I've marked
them as "Awaiting Upstream" (which is basically equivalanet to a reject,
sorry).

Regards,
Yann E. MORIN.

> 
>  package/ecryptfs-utils/Config.in              |  2 --
>  ...6092_Add_support_for_building_xtensa.patch | 33 +++++++++++++++++++
>  package/libnspr/Config.in                     |  8 -----
>  package/libnss/Config.in                      |  2 --
>  package/spidermonkey/Config.in                |  1 -
>  5 files changed, 33 insertions(+), 13 deletions(-)
>  create mode 100644 package/libnspr/0001-Bug_1606092_Add_support_for_building_xtensa.patch
> 
> -- 
> 2.20.1
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
