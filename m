From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:19:45 +0200
Subject: [Buildroot] [PATCH 2/2] packages/rsyslog: add support for RELP
In-Reply-To: <20200921165834.7514-3-dgouarin@gmail.com>
References: <20200921165834.7514-1-dgouarin@gmail.com>
 <20200921165834.7514-3-dgouarin@gmail.com>
Message-ID: <20200923221945.050f9eda@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Sep 2020 18:58:34 +0200
David GOUARIN <dgouarin@gmail.com> wrote:

> +config BR2_PACKAGE_RSYSLOG_RELP
> +	bool "enable support for relp logging protocol"
> +	depends on BR2_PACKAGE_RSYSLOG
> +	select BR2_PACKAGE_LIBRELP
> +	help
> +	  Enable relp rsyslog plugin.

I dropped this option entirely.

> +ifeq ($(BR2_PACKAGE_RSYSLOG_RELP),y)

And simply made this based on the following condition:

ifeq ($(BR2_PACKAGE_LIBRELP),y)

> +RSYSLOG_DEPENDENCIES += librelp
> +RSYSLOG_PLUGINS += relp
> +endif

And I've applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
