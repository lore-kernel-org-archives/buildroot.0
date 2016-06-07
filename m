From: Andrew Webster <Awebster@arcx.com>
Date: Tue, 7 Jun 2016 20:15:29 +0000
Subject: [Buildroot] [PATCH v6 2/3] docker-containerd: new package
In-Reply-To: <1464475578-22239-3-git-send-email-christian@paral.in>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-3-git-send-email-christian@paral.in>
Message-ID: <c77de68d3e294523a2079b68deffed57@WEBMAIL.arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of Christian Stewart
> Sent: Saturday, May 28, 2016 6:46 PM

> +define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
> +	ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
> +	$(INSTALL) -D -m 0755 $(@D)/bin/containerd $(TARGET_DIR)/usr/bin/docker-containerd
> +	$(INSTALL) -D -m 0755 $(@D)/bin/containerd-shim $(TARGET_DIR)/usr/bin/containerd-shim
> +endef

Should this target be $(TARGET_DIR)/usr/bin/docker-containerd-shim instead?
 
