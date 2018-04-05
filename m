From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Apr 2018 20:49:26 +0200
Subject: [Buildroot] [PATCH] qt5base: remove use of QT5BASE_EXTRA_CFLAGS
In-Reply-To: <1522881016-6423-1-git-send-email-joshua.henderson@microchip.com>
References: <1522881016-6423-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180405184926.GA22364@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joshua, All,

On 2018-04-04 15:30 -0700, Joshua Henderson spake thusly:
> This variable was added as part of an EGL i.MX6 workaround in commit
> (7e9f459adf), but appears to currently be abandonded and unused.  Remove the use
> of the variable.
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/qt5/qt5base/qt5base.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index a7eb0ec..750830a 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -296,8 +296,8 @@ define QT5BASE_CONFIGURE_CMDS
>  		-nomake tests \
>  		-device buildroot \
>  		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
> -		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS) $(QT5BASE_EXTRA_CFLAGS)" \
> -		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS) $(QT5BASE_EXTRA_CFLAGS)" \
> +		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
> +		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
>  		$(QT5BASE_CONFIGURE_OPTS) \
>  	)
>  endef
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
