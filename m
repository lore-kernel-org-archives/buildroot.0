From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 01 Aug 2018 18:22:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: add optional support
 for linux-pam
References: <20180801132114.24273-1-apanfilov@spectracom.com>
Message-ID: <5b393fxsn8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 01 Aug 2018 16:21:14 +0300 schrieb Artem Panfilov:

> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +PURE_FTPD_CONF_OPTS += --with-pam
> +PURE_FTPD_DEPENDENCIES += linux-pam
> +endif

Hi Artem,

could you please add

	else
	PURE_FTPD_CONF_OPTS += --without-pam

to make sure the outcome of the configure step takes our config into 
account and not defaults chosen by upstream?

Thanks!

Regards, Bernd
