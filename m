From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Jun 2013 14:44:14 +0200
Subject: [Buildroot] [PATCH] sconeserver: fix autouild failure
In-Reply-To: <1370261409-8722-1-git-send-email-spdawson@gmail.com>
References: <1370261409-8722-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130603144414.562f9385@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Mon,  3 Jun 2013 13:10:09 +0100, spdawson at gmail.com wrote:

> diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
> index 744f389..565d467 100644
> --- a/package/sconeserver/sconeserver.mk
> +++ b/package/sconeserver/sconeserver.mk
> @@ -60,7 +60,8 @@ endif
>  ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
>  	SCONESERVER_DEPENDENCIES += mysql_client
>  	SCONESERVER_CONF_OPT += --with-mysql \
> -		--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config"
> +		--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config" \
> +		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/mysql"
>  else
>  	SCONESERVER_CONF_OPT += --without-mysql
>  endif

This more-or-less reverts part of your commit
8d34e073c00236ff41a6df8f0fdd6b0b25dc4ad1. Is there a reason why
sconeserver isn't taking the right ldflags from mysql_config?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
