From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jun 2013 17:02:18 -0300
Subject: [Buildroot] [PATCH] jimtcl: new package
In-Reply-To: <1372252177-3592-1-git-send-email-elezegarcia@gmail.com>
References: <1372252177-3592-1-git-send-email-elezegarcia@gmail.com>
Message-ID: <51CC9A4A.9040206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/26/2013 10:09 AM, Ezequiel Garcia wrote:

A few fixes...

> +JIMTCL_VERSION = 0.73
> +JIMTCL_SITE = git://repo.or.cz/jimtcl.git
> +JIMTCL_SITE_METHOD = git
> +JIMTCL_INSTALL_STAGING = YES

Why not use the debian mirror as i did?
It's usually nicer to do http since some paranoid firewalling in some
companies block git access.

> +ifneq ($(BR2_PACKAGE_TCL),y)
> +define JIMTCL_LINK_TCLSH
> +	ln -sf jimsh $(TARGET_DIR)/usr/bin/tclsh
> +endef
> +endif

Positive logic preferred...
ifeq ($(BR2_PACKAGE_TCL),)
...
(my fault from my old submission though).

Care to resend a V2?
Thanks.
