From: Christian Stewart <christian@paral.in>
Date: Wed, 30 Jan 2019 19:11:33 -0800
Subject: [Buildroot] [PATCH] package/docker-engine: add sysv init script
In-Reply-To: <20190130222810.3927-1-peter@korsgaard.com>
References: <20190130222810.3927-1-peter@korsgaard.com>
Message-ID: <87sgx9ed22.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard <peter@korsgaard.com> writes:

> +++ b/package/docker-engine/S60dockerd
> @@ -0,0 +1,38 @@
> +#!/bin/sh
> +
> +NAME=dockerd
> +DAEMON=/usr/bin/$NAME
> +PIDFILE=/var/run/$NAME.pid
> +DAEMON_ARGS=""

We pull the systemd unit file from /contrib/init/systemd/docker.service
within the docker-engine codebase.

There also exists /contrib/init/openrc as well as sysvinit-debian,
sysvinit-redhat, and upstart. I guess none of these are suitable for the
sysv init system.

> +define DOCKER_ENGINE_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 package/docker-engine/S60dockerd \
> +		$(TARGET_DIR)/etc/init.d/S60dockerd
> +endef

In general LGTM.

Acked-by: Christian Stewart <christian@paral.in>

Best,
Christian
