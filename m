From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 04 Jan 2013 08:41:22 -0300
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <50E6BFE2.2090405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/03/2013 07:09 PM, Stefan Fr?berg wrote:

> +define DIVINE_STAGING_DIVINE_CONFIG_FIXUP
> +	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/divine-config
> +	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/divine-config
> +endef
> +
> +DIVINE_POST_INSTALL_STAGING_HOOKS += DIVINE_STAGING_DIVINE_CONFIG_FIXUP
> +

This could be handled in a generic way for all the packages that ship a
*-config file.
Something like:

DIVINE_CONFIG_FIXUP = divine-config

And then do the generic sed magic in package/pkg-generic.mk
How about that?
Regards.
