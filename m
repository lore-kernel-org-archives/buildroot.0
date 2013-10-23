From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Oct 2013 22:44:10 +0100
Subject: [Buildroot] [PATCH v2 2/2] docker: add license info
In-Reply-To: <1382560114-25036-2-git-send-email-arnout@mind.be>
References: <1382560114-25036-1-git-send-email-arnout@mind.be>
 <1382560114-25036-2-git-send-email-arnout@mind.be>
Message-ID: <20131023214410.GA18090@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-10-23 22:28 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: no change
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/docker/docker.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/docker/docker.mk b/package/docker/docker.mk
> index c1c8efd..4b597d1 100644
> --- a/package/docker/docker.mk
> +++ b/package/docker/docker.mk
> @@ -7,6 +7,11 @@
>  DOCKER_VERSION = 1.5
>  DOCKER_SITE = http://icculus.org/openbox/2/docker
>  
> +DOCKER_DEPENDENCIES = host-pkgconf libglib2 xlib_libX11

Shouldn't this go in the previous patch?

> +DOCKER_LICENSE = GPLv2+
> +# The 'or later' is specified at the end of the README, so include that one too.
> +DOCKER_LICENSE_FILES = COPYING README
> +
>  define DOCKER_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		XLIBPATH=$(STAGING_DIR)/usr/lib

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
