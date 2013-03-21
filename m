From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Mar 2013 00:18:30 +0100
Subject: [Buildroot] [PATCH] dosfstools: fix host variant dependencies
In-Reply-To: <1363867954-28937-1-git-send-email-gustavo@zacarias.com.ar>
References: <1363867954-28937-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <201303220018.30913.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On Thursday 21 March 2013 Gustavo Zacarias wrote:
> host-dosfstools shouldn't pull host-libiconv in since that's for
> uClibc-based toolchains and we don't have that package anyway.
> Fixes:
> http://autobuild.buildroot.net/results/7637985bfb0afdd9217c297e9b0ac5de797c137d/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Thanks for fixing my breakage! ;-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/dosfstools/dosfstools.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
> index 332f2ee..79d1c7a 100644
> --- a/package/dosfstools/dosfstools.mk
> +++ b/package/dosfstools/dosfstools.mk
> @@ -10,6 +10,9 @@ DOSFSTOOLS_LICENSE = GPLv3+
>  DOSFSTOOLS_LICENSE_FILES = COPYING
>  DOSFSTOOLS_LDFLAGS = $(TARGET_LDFLAGS)
>  
> +# Avoid target dosfstools dependencies, no host-libiconv
> +HOST_DOSFSTOOLS_DEPENDENCIES =
> +
>  ifneq ($(BR2_ENABLE_LOCALE),y)
>  DOSFSTOOLS_DEPENDENCIES += libiconv
>  DOSFSTOOLS_LDFLAGS += -liconv
> -- 
> 1.8.1.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
