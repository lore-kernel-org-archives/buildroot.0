From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Jan 2019 08:32:04 +0100
Subject: [Buildroot] [PATCH] package/docker-engine: add sysv init script
In-Reply-To: <87sgx9ed22.fsf@paral.in> (Christian Stewart's message of "Wed,
 30 Jan 2019 19:11:33 -0800")
References: <20190130222810.3927-1-peter@korsgaard.com>
 <87sgx9ed22.fsf@paral.in>
Message-ID: <87k1ilz3ij.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi Peter,
 > Peter Korsgaard <peter@korsgaard.com> writes:

 >> +++ b/package/docker-engine/S60dockerd
 >> @@ -0,0 +1,38 @@
 >> +#!/bin/sh
 >> +
 >> +NAME=dockerd
 >> +DAEMON=/usr/bin/$NAME
 >> +PIDFILE=/var/run/$NAME.pid
 >> +DAEMON_ARGS=""

 > We pull the systemd unit file from /contrib/init/systemd/docker.service
 > within the docker-engine codebase.

 > There also exists /contrib/init/openrc as well as sysvinit-debian,
 > sysvinit-redhat, and upstart. I guess none of these are suitable for the
 > sysv init system.

Yes, but those all look very complicated and/or does more than we want,
E.G. handling the croupfs mounts which we do in S30cgroupfs.


 >> +define DOCKER_ENGINE_INSTALL_INIT_SYSV
 >> +	$(INSTALL) -D -m 755 package/docker-engine/S60dockerd \
 >> +		$(TARGET_DIR)/etc/init.d/S60dockerd
 >> +endef

 > In general LGTM.

 > Acked-by: Christian Stewart <christian@paral.in>

Thanks.

Committed, thanks.

-- 
Bye, Peter Korsgaard
