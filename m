From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 15:15:50 +0200
Subject: [Buildroot] [PATCH 02/34] reproducibility: override locale and
 timezone
In-Reply-To: <1462002570-14706-2-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-2-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507151550.48e49913@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:48:58 +0200, Gilles Chanteperdrix wrote:
> ---
>  Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)

Missing SoB.

> diff --git a/Makefile b/Makefile
> index ec7dccb..86b2ed2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -218,6 +218,13 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
>  -include $(BR2_CONFIG)
>  endif
>  
> +export BR2_REPRODUCIBLE

Why ?

> +ifeq ($(BR2_REPRODUCIBLE),y)
> +export TZ=UTC
> +export LANG=C
> +export LC_ALL=C
> +endif

Regarding overriding TZ, LANG and LC_ALL, I'm wondering if we shouldn't
do it unconditionally, regardless of the value of BR2_REPRODUCIBLE.
What is the benefit of leaving those variable to their value from the
build environment?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
