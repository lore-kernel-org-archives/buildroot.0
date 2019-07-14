From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 18:39:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/cpio: add host version
In-Reply-To: <20190714162335.12684-1-itsatharva@gmail.com>
References: <20190714162335.12684-1-itsatharva@gmail.com>
Message-ID: <20190714163915.GA29941@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atharva, All,

On 2019-07-14 21:53 +0530, Atharva Lele spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The latest cpio has a --reproducible option, which may come handy when
> we try to, well, be reproducible...
> 
> Reported-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> [Atharva: Made change pointed out by Arnout: remove HOST_CPIO_CONF_OPTS]

Actually, this is not very intereesting, because it does not say what
was in HOST_CPIO_CONF_OPTS. What we need to know is that we do not need
to force --bindir. So, I'd have written:
    [Atharva: don't force --bindir, as noticed by Arnout]

> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Atharva Lele <itsatharva@gmail.com>

Except for the minor nit above:

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Add patch from Yann to my series
> ---
>  package/cpio/cpio.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
> index 9a09279572..cc40838840 100644
> --- a/package/cpio/cpio.mk
> +++ b/package/cpio/cpio.mk
> @@ -17,3 +17,4 @@ CPIO_DEPENDENCIES += argp-standalone
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 2.22.0
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
