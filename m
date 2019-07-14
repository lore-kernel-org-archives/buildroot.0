From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 20:34:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston-imx: Split weston-imx
 off from weston
In-Reply-To: <20190625225008.58056-1-james.hilliard1@gmail.com>
References: <20190625225008.58056-1-james.hilliard1@gmail.com>
Message-ID: <20190714183438.GG29941@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

Sorry for the delay in replying to this one...

On 2019-06-25 16:50 -0600, James Hilliard spake thusly:
> This is in preparation for migration of weston to the meson build system.
> Since weston-imx is based off of a much older version of weston it is
> difficult to maintain as part of the weston package.

I agree that we should split it into its own package.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> +if BR2_PACKAGE_WESTON_IMX
> +
> +# Helper to make sure at least one compositor is selected.
> +config BR2_PACKAGE_WESTON_IMX_HAS_COMPOSITOR
> +	bool
> +
> +config BR2_PACKAGE_WESTON_IMX_DRM
> +	bool "DRM compositor"

Do all the backends really make sense for the imx fork?

I.e. I would expect that the drm, rdp, etc... backends do not make
sense (maybe just the fbdev one?) and that the oter backends would be
provided only by the real weston, leaving the imx fork nly provide the
backend for imx.

Which implies that we should allow bioth westons to be installed side by
side, and that the imx variant be installed as 'weston-imx', e.g. using
the ./configure flag:

    --program-suffix=-imx

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
