From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 21:23:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: enable gnutls if selected
In-Reply-To: <3b8dd3bb-8ae8-3c7b-2e79-b3f7dc111c12@gmail.com>
References: <3b8dd3bb-8ae8-3c7b-2e79-b3f7dc111c12@gmail.com>
Message-ID: <20200501192302.GB3687@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michele, All,

On 2020-05-01 18:50 +0200, Michele Comignano spake thusly:
> From 6a9cccb28174dc25a3f74bc3a33b0e13eecbfd6e Mon Sep 17 00:00:00 2001
> From: Michele Comignano <comick@gmail.com>
> Date: Wed, 8 Apr 2020 21:48:33 +0200
> Subject: [PATCH 1/1] package/vlc: enable gnutls if selected
> 
> Signed-off-by: Michele Comignano <comick@gmail.com>

Applied to master, thanks!

MNote: your patch was weirdly formatted; be sure to use 'git send-email'
to send your patches, as this prepares correct mails.

Regards,
Yann E. MORIN.

> ---
>  package/vlc/vlc.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index 4b1cd68d8b..1f2af878eb 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -567,4 +567,11 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
>  VLC_DEPENDENCIES += zlib
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +VLC_CONF_OPTS += --enable-gnutls
> +VLC_DEPENDENCIES += gnutls
> +else
> +VLC_CONF_OPTS += --disable-gnutls
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.17.1
> 
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
