From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Dec 2017 00:14:09 +0100
Subject: [Buildroot] [PATCH 1/1] gperf: bump to 3.1
In-Reply-To: <20171229231022.25564-1-Adamduskett@outlook.com>
References: <20171229231022.25564-1-Adamduskett@outlook.com>
Message-ID: <20171229231409.GT3176@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2017-12-29 18:10 -0500, Adam Duskett spake thusly:
> Also add a hash for the license file.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/gperf/gperf.hash | 3 ++-
>  package/gperf/gperf.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
> index 370235c627..218a24e562 100644
> --- a/package/gperf/gperf.hash
> +++ b/package/gperf/gperf.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated after checking pgp signature
> -sha256	767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e	gperf-3.0.4.tar.gz
> +sha256	588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2	gperf-3.1.tar.gz
> +sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
> diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
> index 2a6192a48b..4b928a0ebd 100644
> --- a/package/gperf/gperf.mk
> +++ b/package/gperf/gperf.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GPERF_VERSION = 3.0.4
> +GPERF_VERSION = 3.1

In the past,, we had to revert a simlar patch, because it was causing so
many build failures:

    24fa507acf Revert "gperf: bump to version 3.1"

So, care to have a run of substantial configurations to see if they are
no longer broken? ;-)

Regards,
Yann E. MORIN.

>  GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
>  GPERF_LICENSE = GPL-3.0+
>  GPERF_LICENSE_FILES = COPYING
> -- 
> 2.14.3
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
