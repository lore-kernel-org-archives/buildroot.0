From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:42:39 +0100
Subject: [Buildroot] [PATCH 1/1] Fix npm module cross compilation,
 use up-to-date npm and install modules globally
In-Reply-To: <1416775178-13738-2-git-send-email-mwei@cs.ucsd.edu>
References: <1416775178-13738-1-git-send-email-mwei@cs.ucsd.edu>
 <1416775178-13738-2-git-send-email-mwei@cs.ucsd.edu>
Message-ID: <20141126224239.248beb17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Wei,

On Sun, 23 Nov 2014 12:39:38 -0800, Michael Wei wrote:

> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 312aaa9..fbcb730 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -110,11 +110,13 @@ define NODEJS_INSTALL_MODULES
>  	# npm install call below and setting npm_config_rollback=false can both
>  	# help in diagnosing the problem.
>  	(cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
> +		$(HOST_DIR)/usr/bin/npm install -g npm --prefix=$(HOST_DIR) && \

If I understand correctly, this asks npm to update itself, i.e update
the host npm. If that's the case, then I believe this should rather go
in the HOST_NODEJS_INSTALL_CMDS.

Also, could you explain what the "-g" option changes? I understand it
installs modules "globally", but what means "globally" compared to what
was done before? Sorry for the silly questions, but I'm far from being
a NodeJS guy, so I don't really know how npm works.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
