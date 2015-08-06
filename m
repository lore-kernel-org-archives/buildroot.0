From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 6 Aug 2015 17:31:01 +0200
Subject: [Buildroot] [PATCH 1/1] ibrdtn
In-Reply-To: <1438865424-5000-1-git-send-email-tom_a_sparks@yahoo.com.au>
References: <1438865424-5000-1-git-send-email-tom_a_sparks@yahoo.com.au>
Message-ID: <55C37DB5.3050200@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Tom,

I think it's better if you send separate patches for each new package 
you want to add, along with a good subject such as "new package: <pkg 
name>" or something similar.

Also you are not adding a new entry to package/Config.in in order to 
make your new packages able to be selected in the menu.

On 06/08/15 14:50, Tom Sparks wrote:
> +IBRCOMMON_CONF_OPTS = --with-openssl --with-lowpan   --with-xml

To many spaces between "--with-lowpan" and "--with-xml".

> +IBRCOMMON_INSTALL_STAGING_OPTS = 			\
> +	prefix=$(STAGING_DIR)/usr 		\
> +	exec_prefix=$(STAGING_DIR)/usr 		\
> +	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
> +	install
> +
> +IBRCOMMON_INSTALL_TARGET_OPTS = 			\
> +	prefix=$(TARGET_DIR)/usr 		\
> +	exec_prefix=$(TARGET_DIR)/usr 		\
> +	install

I wouldn't try to align the back-slashes. Just a space and then the 
back-slash.

> +IBRDTN_INSTALL_STAGING_OPTS = 			\
> +	prefix=$(STAGING_DIR)/usr 		\
> +	exec_prefix=$(STAGING_DIR)/usr 		\
> +	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
> +	install
> +
> +IBRDTN_INSTALL_TARGET_OPTS = 			\
> +	prefix=$(TARGET_DIR)/usr 		\
> +	exec_prefix=$(TARGET_DIR)/usr 		\
> +	install

Same here.

> +if BR2_PACKAGE_IBRDTND
> +
> +source "package/ibrcommon/Config.in"
> +source "package/ibrdtn/Config.in"
> +
> +endif

What are you trying to do with this? Making "ibrdtn" the only package 
selectable from menuconfig, and when you select it show the other two in 
the menu as well?

> +IBRDTND_CONF_OPTS =   --with-curl  --with-sqlite     --with-tls

More unnecessary spaces.

> +IBRDTND_INSTALL_STAGING_OPTS = 			\
> +	prefix=$(STAGING_DIR)/usr 		\
> +	exec_prefix=$(STAGING_DIR)/usr 		\
> +	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
> +	install
> +
> +IBRDTND_INSTALL_TARGET_OPTS = 			\
> +	prefix=$(TARGET_DIR)/usr 		\
> +	exec_prefix=$(TARGET_DIR)/usr 		\
> +	install

No alignment, IMHO.

Regards,

Vincent.
