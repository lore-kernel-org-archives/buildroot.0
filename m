From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 11:27:55 +0200
Subject: [Buildroot] [PATCH 08/14] aiccu: don't link with librt
In-Reply-To: <947c2a62e5d2f4da7e74cb0f332fe73be5c36df1.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
 <947c2a62e5d2f4da7e74cb0f332fe73be5c36df1.1497583686.git.baruch@tkos.co.il>
Message-ID: <20170618092755.GI2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-06-16 06:32 +0300, Baruch Siach spake thusly:
> Buildroot no longer supports toolchains with glibc older than 2.17, so there
> is no need to link with librt for clock_* system calls.
> 
> Cc: Michael Rommel <rommel@layer-7.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/aiccu/0003-clock-suite-functions-fix.patch     | 18 ------------------
>  ...f-ether-header.patch => 0003-if-ether-header.patch} |  0
>  2 files changed, 18 deletions(-)
>  delete mode 100644 package/aiccu/0003-clock-suite-functions-fix.patch
>  rename package/aiccu/{0004-if-ether-header.patch => 0003-if-ether-header.patch} (100%)
> 
> diff --git a/package/aiccu/0003-clock-suite-functions-fix.patch b/package/aiccu/0003-clock-suite-functions-fix.patch
> deleted file mode 100644
> index 365e72a2271a..000000000000
> --- a/package/aiccu/0003-clock-suite-functions-fix.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -aiccu: fix undefined reference to clock_* functions
> -
> -Since glibc 2.17 the clock_* suite functions are available directly in 
> -the main C library. For previous versions we still need -lrt to link.
> -
> -Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
> -
> ---- aiccu/unix-console/Makefile.orig	2014-01-14 10:17:20.204602513 +0000
> -+++ aiccu/unix-console/Makefile	2014-01-14 10:17:31.435777359 +0000
> -@@ -42,7 +42,7 @@ CFLAGS	+= -D AICCU_CONSOLE
> - # Currently defaultly builds only on Linux, but other platforms might easily also support it
> - ifeq ($(shell uname | grep -c "Linux"),1)
> - CFLAGS	+= -D AICCU_GNUTLS
> --LDFLAGS += -lgnutls
> -+LDFLAGS += -lgnutls -lrt
> - endif
> - 
> - # Linux
> diff --git a/package/aiccu/0004-if-ether-header.patch b/package/aiccu/0003-if-ether-header.patch
> similarity index 100%
> rename from package/aiccu/0004-if-ether-header.patch
> rename to package/aiccu/0003-if-ether-header.patch
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
