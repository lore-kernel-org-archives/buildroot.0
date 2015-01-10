From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 19:06:39 +0100
Subject: [Buildroot] [PATCH v2] postgresql: add systemd service file
In-Reply-To: <1400620611-7625-1-git-send-email-ps.report@gmx.net>
References: <1400620611-7625-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150110190639.49d20de1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 20 May 2014 23:16:51 +0200, Peter Seiderer wrote:

> +define POSTGRESQL_INSTALL_INIT_SYSTEMD
> +        $(INSTALL) -D -m 644 package/postgresql/postgresql.service \
> +                $(TARGET_DIR)/etc/systemd/system/postgresql.service
> +        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +        ln -fs ../postgresql.service \
> +                $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
> +endef

Tabs should have been used instead of spaces for indentation. I've
fixed that up, and committed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
