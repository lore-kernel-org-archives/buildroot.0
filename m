From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Mar 2021 08:59:37 +0100
Subject: [Buildroot] [PATCH 0/8] package/opkg-utils: add target build
In-Reply-To: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
Message-ID: <20210313075937.GL2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2021-03-12 14:05 -0600, Ryan Barnett spake thusly:
> A first revision of adding opkg-utils as a target package was proposed
> in the following patch:
> 
>   https://patchwork.ozlabs.org/project/buildroot/patch/20210126192605.20002-1-matthew.weber at rockwellcollins.com/
> 
> Based on feedback received from Yann, it uncovered some issues with the
> current host package build for opkg-utils.
> 
> This patch series addresses the following items:
> 
>  * Remove build step since all it does is generate man pages for a
>    single command (Patch 1)
>  * Incorporated accepted patch for splitting off the installation of
>    docs and utils (Patch 2)
>  * Add missing host dependencies for host-opkg-utils which are not
>    manditory packages of for buildroot (Patches 3-6)
>  * Add target package for opkg-utils (Patch 7)
> 
> Thanks,
> -Ryan
> 
> CC: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> Ryan Barnett (8):
>   package/opkg-utils: remove build step
>   package/opkg-utils: install only utility scripts

I've inverted the order of those two first patches; I reworded the
commit log of the now-second patch (I'll reply further in that patch).

Applied to master.

>   package/diffutils: add host package

Applied to master.

>   package/findutils: add host package
>   package/grep: add host package

I've dropped those two, as I explained in the review of...

>   package/opkg-utils: add missing dependencies for host build

... this patch: grep and find are already required (but not on the list
in the manual).

Applied to master with less dependencies and a commit log reworded
accodingly.

I got short on time, so I stopped here. I'll resume the remaining two
later.

Thanks!

Regards,
Yann E. MORIN.

>   package/opkg-utils: add opkg-utils as target pkg
>   DEVELOPERS: Add Ryan Barnett for opkg and opkg-utils
> 
>  DEVELOPERS                                    |  2 +
>  package/Config.in                             |  1 +
>  package/diffutils/diffutils.mk                |  1 +
>  package/findutils/findutils.mk                |  1 +
>  package/grep/grep.mk                          |  1 +
>  ...-seperate-manpages-and-utils-install.patch | 50 +++++++++++++++++++
>  package/opkg-utils/Config.in                  | 33 ++++++++++++
>  package/opkg-utils/opkg-utils.mk              | 31 ++++++++++--
>  8 files changed, 116 insertions(+), 4 deletions(-)
>  create mode 100644 package/opkg-utils/0001-Makefile-seperate-manpages-and-utils-install.patch
>  create mode 100644 package/opkg-utils/Config.in
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
