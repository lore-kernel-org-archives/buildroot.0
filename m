From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 19:47:15 +0100
Subject: [Buildroot] [PATCH] package/opentracing-cpp: fix build if
 clang-tidy is installed on the host
In-Reply-To: <20210119171742.23245-1-patrickdepinguin@gmail.com>
References: <20210119171742.23245-1-patrickdepinguin@gmail.com>
Message-ID: <20210126184715.GZ2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-01-19 18:17 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> opentracing-cpp fails to build if clang-tidy is installed:
[--SNIP--]
> Disable the 'ENABLE_LINTING' option to avoid this influence.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/opentracing-cpp/opentracing-cpp.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
> index d466a80237..0605cd5d96 100644
> --- a/package/opentracing-cpp/opentracing-cpp.mk
> +++ b/package/opentracing-cpp/opentracing-cpp.mk
> @@ -22,4 +22,6 @@ else ifeq ($(BR2_SHARED_LIBS),y)
>  OPENTRACING_CPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
>  endif
>  
> +OPENTRACING_CPP_CONF_OPTS += -DENABLE_LINTING=OFF
> +
>  $(eval $(cmake-package))
> -- 
> 2.26.2
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
