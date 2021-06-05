From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 21:36:30 +0200
Subject: [Buildroot] [PATCH 1/2] package/gptfdisk: security bump version
 to 1.0.7
In-Reply-To: <20210605081505.96903-1-bernd.kuhls@t-online.de>
References: <20210605081505.96903-1-bernd.kuhls@t-online.de>
Message-ID: <20210605193630.GR168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-06-05 10:15 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://sourceforge.net/p/gptfdisk/code/ci/master/tree/NEWS
> 
> Version 1.0.6 fixes CVE-2020-0256 & CVE-2021-0308.
> 
> Removed md5 hash.
> 
> Rebased patch due to upstream commit
> https://sourceforge.net/p/gptfdisk/code/ci/6180deb472c302c47f4d4acff8f2123d10824364/#diff-3
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...curses-partially-revert-Tweaks-for-building-on-th.patch | 2 +-
>  package/gptfdisk/gptfdisk.hash                             | 7 +++----
>  package/gptfdisk/gptfdisk.mk                               | 2 +-
>  3 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch b/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch
> index 518639387a..02f954531a 100644
> --- a/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch
> +++ b/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch
> @@ -29,7 +29,7 @@ index 1b18cf2..4ebfde1 100644
>   #include <iostream>
>   #include <string>
>   #include <sstream>
> --#ifdef __APPLE__
> +-#if defined (__APPLE__) || (__FreeBSD__)
>   #include <ncurses.h>
>  -#else
>  -#include <ncursesw/ncurses.h>
> diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
> index bff17dcc21..7894f2187d 100644
> --- a/package/gptfdisk/gptfdisk.hash
> +++ b/package/gptfdisk/gptfdisk.hash
> @@ -1,6 +1,5 @@
> -# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.5/
> -md5  58dac67c85e46ca87b587231549aefe6  gptfdisk-1.0.5.tar.gz
> -sha1  b642aa628cbc9fa63e9a73dad5acc588042527ac  gptfdisk-1.0.5.tar.gz
> +# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.7/
> +sha1  406ab2596e1911c916dce677ce7e903076d94c6d  gptfdisk-1.0.7.tar.gz
>  # Locally computed
> -sha256  0e7d3987cd0488ecaf4b48761bc97f40b1dc089e5ff53c4b37abe30bc67dcb2f  gptfdisk-1.0.5.tar.gz
> +sha256  754004b7f85b279287c7ac3c0469b1d7e0eae043a97a2e587b0560ca5f3828c0  gptfdisk-1.0.7.tar.gz
>  sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
> index e848837b76..d92a527105 100644
> --- a/package/gptfdisk/gptfdisk.mk
> +++ b/package/gptfdisk/gptfdisk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GPTFDISK_VERSION = 1.0.5
> +GPTFDISK_VERSION = 1.0.7
>  GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
>  GPTFDISK_LICENSE = GPL-2.0+
>  GPTFDISK_LICENSE_FILES = COPYING
> -- 
> 2.29.2
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
