From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 20:39:02 +0200
Subject: [Buildroot] [PATCH v2 08/16] package/apr-util: add optional
 dependency to openssl
In-Reply-To: <1412530744-20649-9-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
 <1412530744-20649-9-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141005203902.5d8c5dcf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  5 Oct 2014 19:38:56 +0200, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +APR_UTIL_CONF_OPTS += --with-crypto --with-openssl="$(STAGING_DIR)/usr"
> +APR_UTIL_DEPENDENCIES += openssl
> +else
> +APR_UTIL_CONF_OPTS += --without-ssl
> +endif

This looks weird, because there's no symmetry between --with-openssl
--with-crypto and --without-ssl. Isn't there an issue here?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
