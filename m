From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Jan 2017 17:27:02 +0100
Subject: [Buildroot] [PATCH 2/3] tslib: disable raw input plugin under
 kernel < v3.12
In-Reply-To: <4e6b08821af14328fceacf79bbdfa70f82deae8e.1484425049.git.baruch@tkos.co.il>
References: <9af1cba158ce6dcb96f5f121d4105895fea911b9.1484425049.git.baruch@tkos.co.il>
 <4e6b08821af14328fceacf79bbdfa70f82deae8e.1484425049.git.baruch@tkos.co.il>
Message-ID: <20170115162702.GE3552@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-01-14 22:17 +0200, Baruch Siach spake thusly:
> The SYN_CNT input code was added in kernel v3.12.
> 
> Fixes:
> http://autobuild.buildroot.net/results/5cd/5cdb9d22092e9222cc7e8fe8dd3936305a5d371d/
> http://autobuild.buildroot.net/results/211/2115038caff1e036cbc9dcb5cb6905abe643552a/
> http://autobuild.buildroot.net/results/c79/c79de6fdd5cfe406979941790276296b6d1ec0b8/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Again, you beat me to it. ;-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/tslib/tslib.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
> index d6e66b723955..7f74ca5fed04 100644
> --- a/package/tslib/tslib.mk
> +++ b/package/tslib/tslib.mk
> @@ -13,4 +13,8 @@ TSLIB_AUTORECONF = YES
>  TSLIB_INSTALL_STAGING = YES
>  TSLIB_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
>  
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12),)
> +TSLIB_CONF_OPTS += --disable-input
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.11.0
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
