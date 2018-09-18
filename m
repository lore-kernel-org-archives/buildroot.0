From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 22:03:10 +0200
Subject: [Buildroot] [PATCH v2 2/2] monkey: add option for SSL/TLS
 plugin compilation
In-Reply-To: <1537189549-26857-2-git-send-email-david.pierret@smile.fr>
References: <1537189549-26857-1-git-send-email-david.pierret@smile.fr>
 <1537189549-26857-2-git-send-email-david.pierret@smile.fr>
Message-ID: <20180918220310.348f748a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Sep 2018 15:05:49 +0200, david.pierret at smile.fr wrote:

> +ifeq ($(BR2_PACKAGE_MONKEY_SSL),y)
> +MONKEY_CONF_OPTS += --enable-plugins=tls --mbedtls-shared

You forgot:

MONKEY_DEPENDENCIES += mbedtls

here. Without this, you don't have the guarantee that mbedtls will be
built before monkey.

I've fixed this and applied your patch to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
