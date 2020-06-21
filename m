From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 23:43:15 +0200
Subject: [Buildroot] [PATCH] pru-software-suppoer: bump to latest
 version 5.7.0
In-Reply-To: <20200611011226.581262-1-ashcharles@gmail.com>
References: <20200611011226.581262-1-ashcharles@gmail.com>
Message-ID: <20200621214315.GS2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ash, All,

Typo in the commit title: s/suppoer/support/

On 2020-06-10 21:12 -0400, Ash Charles spake thusly:
> Update to the latest version of the PRU software support [1].
> 
> [1] https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package
> 
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> ---
>  package/pru-software-support/pru-software-support.hash | 2 +-
>  package/pru-software-support/pru-software-support.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
> index 9deb3e6661..25c4c305e8 100644
> --- a/package/pru-software-support/pru-software-support.hash
> +++ b/package/pru-software-support/pru-software-support.hash
> @@ -1,3 +1,3 @@
>  # Locally-calculated hash
> -sha256  d6d1f76ab5a50dbdf1dff834b271f9d3ffa7424e4d9615e00713f3f81ed5787e  pru-software-support-package-v5.6.0.tar.gz
> +sha256  57e47128dc5437c5a64d4ef94f419d9ea38e894c0c31ab10cad99c0da614b296  pru-software-support-package-v5.7.0.tar.gz
>  sha256  a68530804624227e4f2e007eacb5c2d616695426082e895ee1e2d77d3833f5f7  PRU-Package-v6.0-Manifest.html

The license file has chamged, too: it has been at least renamed, and
maybe its content has changed. You can check with:

    $ make pru-software-support-legla-info

Care to respin with the license hash fixed, please? Do not forget to
explain, in the commit log, what changed about the licensing terms
(even if only for the copyright year)

Regards,
Yann E. MORIN.

> diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
> index b56ac0af12..8c7156316b 100644
> --- a/package/pru-software-support/pru-software-support.mk
> +++ b/package/pru-software-support/pru-software-support.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PRU_SOFTWARE_SUPPORT_VERSION = 5.6.0
> -# https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot/pru-software-support-package-5.6.0.tar.gz
> +PRU_SOFTWARE_SUPPORT_VERSION = 5.7.0
> +# https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot/pru-software-support-package-5.7.0.tar.gz
>  PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
>  PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
>  PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, GPL-2.0, Public Domain
> -- 
> 2.24.1
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
