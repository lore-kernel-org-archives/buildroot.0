From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Wed, 04 Sep 2013 17:50:47 +0200
Subject: [Buildroot] [git commit] kmod: disable manpages for host-kmod
In-Reply-To: <20130904103707.9F2B29B6EB@busybox.osuosl.org>
References: <20130904103707.9F2B29B6EB@busybox.osuosl.org>
Message-ID: <b95086f02b4d393fa6f90f388a0f20d3@www.sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 2013-09-04 12:36, Peter Korsgaard wrote:
[...]
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index 169fca3..a1ad7d6 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -23,6 +23,9 @@ KMOD_LICENSE_FILES = libkmod/COPYING
>  # 
> https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
>  KMOD_CONF_OPT = --disable-static --enable-shared
>
> +# manpages not installed to host and needs xsltproc
> +HOST_KMOD_CONF_OPT = --disable-manpages
> +
>  ifneq ($(BR2_HAVE_DOCUMENTATION),y)
>  KMOD_CONF_OPT += --disable-manpages
>  endif
What happens when BR2_HAVE_DOCUMENTATION is enabled? I think same 
problem happens.

We should add a dependency to host-libxslt and I think we can pass 
variable XSLTPROC= to ./configure to use a specific location of 
xsltproc.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
