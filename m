From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Apr 2020 22:01:33 +0200
Subject: [Buildroot] [PATCH] package/strace: bump to version 5.5
In-Reply-To: <20200210074030.18953-1-Evgeniy.Didin@synopsys.com>
References: <20200210074030.18953-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20200401200133.GW22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Evgeniy, All,

On 2020-02-10 10:40 +0300, Evgeniy Didin spake thusly:
> Drop patch.
> Strace 5.5 now is compatible with glibc-2.31 and 
> Linux kernel headers < 5.3.
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
[--SNIP--]
> diff --git a/package/strace/strace.hash b/package/strace/strace.hash
> index dfc2143d65..44358e81a3 100644
> --- a/package/strace/strace.hash
> +++ b/package/strace/strace.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
> -# https://strace.io/files/5.4/strace-5.4.tar.xz.asc
> -sha256	f7d00514d51290b6db78ad7a9de709baf93caa5981498924cbc9a744cfd2a741	strace-5.4.tar.xz
> +# https://strace.io/files/5.5/strace-5.5.tar.xz.asc
> +sha256	9f58958c8e59ea62293d907d10572e352b582bd7948ed21aa28ebb47e5bf30ff	strace-5.5.tar.xz
>  sha256	739b2725197137a04ab48ee6b19da3fdf7e497249e0dedd9f51c11a570401ede	COPYING
>  sha256	7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa	LGPL-2.1-or-later

You forgot to test the legla-info, and the COPYING file has changed:

>>> strace 5.5 Collecting legal info
ERROR: COPYING has wrong sha256 hash:
ERROR: expected: 739b2725197137a04ab48ee6b19da3fdf7e497249e0dedd9f51c11a570401ede
ERROR: got     : 6370eb67db918210944a8511a6995ebe9567852f26b4f15a01e5c8cf2aef7c46
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make[1]: *** [package/strace/strace.mk:47: strace-legal-info] Error 1
make: *** [Makefile:23: _all] Error 2

This is caused by a change in the copyright year.

I've fixed, added the autobuild reference provided by Baruch, and
applied to master, thanks.

Regards,
Yann E. MORIN.

> diff --git a/package/strace/strace.mk b/package/strace/strace.mk
> index 5ad249b13c..569a822e42 100644
> --- a/package/strace/strace.mk
> +++ b/package/strace/strace.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -STRACE_VERSION = 5.4
> +STRACE_VERSION = 5.5
>  STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
>  STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
>  STRACE_LICENSE = LGPL-2.1+
> -- 
> 2.16.2
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
