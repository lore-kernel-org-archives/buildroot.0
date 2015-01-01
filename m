From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Jan 2015 19:08:42 +0100
Subject: [Buildroot] [PATCH 2/2 v8] pkg-download: silence downloads if
	make is silent
In-Reply-To: <CAHkwnC9W6r9NqSWzF09uAKbj8xjyMFDArDeFgwNYdE7HVyjc0A@mail.gmail.com>
References: <cover.1420130984.git.yann.morin.1998@free.fr>
 <70490271dbf1774e87cc5dab1a5e907105afeb62.1420130984.git.yann.morin.1998@free.fr>
 <CAHkwnC_Ut0qO82jtch03bY8WYxPzfoeycO9NuvYYtO-OKRd=DQ@mail.gmail.com>
 <20150101175819.GE4360@free.fr>
 <CAHkwnC9W6r9NqSWzF09uAKbj8xjyMFDArDeFgwNYdE7HVyjc0A@mail.gmail.com>
Message-ID: <20150101180842.GG4360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-01-01 19:03 +0100, Fabio Porcedda spake thusly:
> On Thu, Jan 1, 2015 at 6:58 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Fabio, All,
> >
> > On 2015-01-01 18:54 +0100, Fabio Porcedda spake thusly:
> >> On Thu, Jan 1, 2015 at 5:50 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> > From: Fabio Porcedda <fabio.porcedda@gmail.com>
> >> >
> >> > If it is a silent build (make -s -> QUIET=-q) silence all downloads, as
> >> > well as the check-hash. Only stdout is redirected, stderr is still
> >> > visible, for errors and warning.
> >>
> >> Hi Yann,
> >> nice idea, i tried this patch but even if it works for check-hash and
> >> svn it does not works for the git backend (e.g. libubox) and the wget
> >> bakend (try it without the QUIET flags in the WGET variable).
> >>
> >> I don't understand the reason for this behavior.
> >> Do you have an idea for this strange behavior?
> >
> > Damn, no. I'll have look.
> 
> Thank, i think that it must works even when the QUIET variables is not
> added to the environment variables:

Yes, that's right.

Regards,
Yann E. MORIN.

>  diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 9c782fe..5e74519 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -8,14 +8,14 @@
>  ################################################################################
> 
>  # Download method commands
> -export WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
> +export WGET := $(call qstrip,$(BR2_WGET))
>  export SVN := $(call qstrip,$(BR2_SVN))
>  export CVS := $(call qstrip,$(BR2_CVS))
>  export BZR := $(call qstrip,$(BR2_BZR))
>  export GIT := $(call qstrip,$(BR2_GIT))
> -export HG := $(call qstrip,$(BR2_HG)) $(QUIET)
> -export SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
> -SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
> +export HG := $(call qstrip,$(BR2_HG))
> +export SCP := $(call qstrip,$(BR2_SCP))
> +SSH := $(call qstrip,$(BR2_SSH))
>  export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
> 
>  DL_WRAPPER = support/download/dl-wrapper
> 
> BR
> -- 
> Fabio Porcedda

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
