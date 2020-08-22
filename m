From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Aug 2020 17:52:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix build with luajit
In-Reply-To: <20200822130243.1432461-1-fontaine.fabrice@gmail.com>
References: <20200822130243.1432461-1-fontaine.fabrice@gmail.com>
Message-ID: <20200822155216.GA8728@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-08-22 15:02 +0200, Fabrice Fontaine spake thusly:
> Build with luajit has been enabled with commit
> 911a9bf5739d94545cc482c765f876a9ff73e304 however the build fails because
> collectd does not find liblua
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/31302b47fb70eb442cd000f4b9f27a9e12432cc3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/collectd/collectd.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index 21da8fddc8..25ffaa7468 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -198,6 +198,9 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  COLLECTD_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
>  endif
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +COLLECTD_CONF_ENV += LIBLUA_PKG_CONFIG_NAME=luajit
> +endif
>  ifeq ($(BR2_PACKAGE_MYSQL),y)
>  COLLECTD_CONF_OPTS += --with-libmysql=$(STAGING_DIR)/usr
>  endif
> -- 
> 2.28.0
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
