From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jun 2021 21:22:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston: disable -NDEBUG
In-Reply-To: <20210615005534.4155014-1-james.hilliard1@gmail.com>
References: <20210615005534.4155014-1-james.hilliard1@gmail.com>
Message-ID: <20210616192238.GO2610983@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2021-06-14 18:55 -0600, James Hilliard spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/f42/f420890de1b52786f8cf5f2922b69c909162eaa1/

It is just tests that can't be built with -DNDEBUG. It would be a shame
to have to build the whole thing without NDEBUG, just becuase of tests
that are not usefull on the target...

Is it possible to just disable building tests at all? Or if not, can't
we just patch them out?

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/weston/weston.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 8afe4bbab4..abafb3a6d9 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -19,6 +19,8 @@ WESTON_CONF_OPTS = \
>  	-Dcolor-management-colord=false \
>  	-Dremoting=false
>  
> +WESTON_CFLAGS="$(TARGET_CFLAGS) -UNDEBUG"
> +
>  # Uses VIDIOC_EXPBUF, only available from 3.8+
>  ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
>  WESTON_CONF_OPTS += -Dsimple-clients=dmabuf-v4l
> -- 
> 2.25.1
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
