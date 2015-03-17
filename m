From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 22:58:08 +0100
Subject: [Buildroot] [PATCH v1] collectd: fix postgresql library
 detection
In-Reply-To: <1426628645-26181-1-git-send-email-ps.report@gmx.net>
References: <1426628645-26181-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150317225808.3c2af021@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 17 Mar 2015 22:44:05 +0100, Peter Seiderer wrote:

>  ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
>  	COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
> +	COLLECTD_CONF_ENV = LIBS="-lpthread -lm"

If they are needed, why isn't pg_config returning those linker flags?

I'm sorry to be annoying, but I really don't like adding LIBS variables
all over the place, because they tend to become wrong/unneeded, and we
never notice.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
