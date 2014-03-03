From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Mar 2014 22:49:09 +0100
Subject: [Buildroot] [PATCH v2] infra: Add PRE_*_HOOKS for every step
In-Reply-To: <1393167069-4244-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1393167069-4244-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140303214908.GH3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-02-23 15:51 +0100, Maxime Hadjinlian spake thusly:
> Add PRE_*_HOOKS to all the different steps through which a package may go.
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 555c3c2..b68b1f0 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
[--SNIP--]
> @@ -377,19 +385,28 @@ $(2)_EXTRACT_CMDS ?= \
>  	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
>  	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
>  
> -# post-steps hooks
> +# pre/post-steps hooks
> +$(2)_PRE_DOWNLOAD_HOOKS        ?=
>  $(2)_POST_DOWNLOAD_HOOKS        ?=
> +$(2)_PRE_EXTRACT_HOOKS         ?=
>  $(2)_POST_EXTRACT_HOOKS         ?=
> +$(2)_PRE_RSYNC_HOOKS           ?=
>  $(2)_POST_RSYNC_HOOKS           ?=
>  $(2)_PRE_PATCH_HOOKS            ?=
>  $(2)_POST_PATCH_HOOKS           ?=
>  $(2)_PRE_CONFIGURE_HOOKS        ?=
>  $(2)_POST_CONFIGURE_HOOKS       ?=
> +$(2)_PRE_BUILD_HOOKS           ?=
>  $(2)_POST_BUILD_HOOKS           ?=
> +$(2)_PRE_INSTALL_HOOKS         ?=
>  $(2)_POST_INSTALL_HOOKS         ?=
> +$(2)_PRE_INSTALL_STAGING_HOOKS ?=
>  $(2)_POST_INSTALL_STAGING_HOOKS ?=
> +$(2)_PRE_INSTALL_TARGET_HOOKS  ?=
>  $(2)_POST_INSTALL_TARGET_HOOKS  ?=
> +$(2)_PRE_INSTALL_IMAGES_HOOKS  ?=
>  $(2)_POST_INSTALL_IMAGES_HOOKS  ?=
> +$(2)_PRE_LEGAL_INFO_HOOKS      ?=
>  $(2)_POST_LEGAL_INFO_HOOKS      ?=

There's some mis-match in the number of spaces, above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
