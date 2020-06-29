From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 23:21:23 +0200
Subject: [Buildroot] [PATCH 4/4] package/poco: add new option for the
 Poco JWT component
In-Reply-To: <20200629210735.179913-4-juju@cotds.org>
References: <20200629210735.179913-1-juju@cotds.org>
 <20200629210735.179913-4-juju@cotds.org>
Message-ID: <20200629232123.276062d2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Jun 2020 23:07:35 +0200
Julien Olivain <juju@cotds.org> wrote:

> +config BR2_PACKAGE_POCO_JWT
> +	bool "jwt"
> +	select BR2_PACKAGE_POCO_JSON
> +	select BR2_PACKAGE_POCO_CRYPTO
> +	select BR2_PACKAGE_OPENSSL

Do you need to select BR2_PACKAGE_OPENSSL here ? It's already implied
by selecting POCO_CRYPTO. In fact, what made me look in more details is
that you have a "select BR2_PACKAGE_OPENSSL", but "openssl" is not
added to POCO_DEPENDENCIES. It happens to work because you select
POCO_CRYPTO, which already adds "openssl" to POCO_DEPENDENCIES.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
