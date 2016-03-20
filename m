From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:01:27 +0100
Subject: [Buildroot] [PATCH 1/2] norm: new package
In-Reply-To: <1457516142-7421-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457516142-7421-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160320230127.56798c79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Mar 2016 06:35:41 -0300, Gustavo Zacarias wrote:

> +define NORM_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		./waf configure --prefix=/usr \
> +	)

The parenthesis here (and in the other commands) are not needed.

> +# install target doesn't install headers unfortunately...
> +define NORM_INSTALL_STAGING_CMDS
> +	(cd $(@D); \
> +		$(TARGET_MAKE_ENV) \
> +		DESTDIR=$(STAGING_DIR) \
> +		./waf install; \
> +		cp -f $(@D)/include/norm* $(STAGING_DIR)/usr/include \

And there's no reason for this headers copy to be inside the cd $(@D).

I've fixed those two issues and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
