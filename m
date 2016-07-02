From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 11:00:01 +0200
Subject: [Buildroot] [PATCH 01/12] reproducibility: introduce config knob
In-Reply-To: <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160702090001.GA22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2016-06-14 17:31 +0200, Gilles Chanteperdrix spake thusly:
> Making the builds reproducible involves turning off build timestamps,
> which some users may find annoying. So make the reproducible builds
> optional.
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>

Quite obviously:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Note: it may take some time for my reviews on the rest of your series to
come in...

Regards,
Yann E. MORIN.

> ---
>  Config.in | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 9fa7415..faf4c71 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -724,6 +724,17 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
>  
>  endmenu
>  
> +config BR2_REPRODUCIBLE
> +	bool "Make the build reproducible (experimental)"
> +        help
> +          This option will remove all sources of non-reproducibility
> +          from the build process. For a given Buildroot configuration,
> +          this allows to generate exactly identical binaries from one
> +          build to the other, including on different machines.
> +
> +          This is labeled as an experimental feature, as not all
> +          packages behave properly to ensure reproducibility.
> +
>  endmenu
>  
>  source "toolchain/Config.in"
> -- 
> 2.8.2
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
