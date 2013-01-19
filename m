From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jan 2013 14:42:50 +0100
Subject: [Buildroot] xapp_init: bad substitution of mcookie path in
 startx
In-Reply-To: <50FA9F5E.4020005@mind.be>
References: <50BDEE24.6010601@wanadoo.fr> <871uf5obh3.fsf@dell.be.48ers.dk>
 <50F8218F.4070701@wanadoo.fr> <50FA9F5E.4020005@mind.be>
Message-ID: <20130119144250.2d73d60d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sat, 19 Jan 2013 14:27:58 +0100, Arnout Vandecappelle wrote:

>   That's a perfectly clean solution - on condition that mcookie is indeed 
> installed on the target. I guess the option should therefore be in an
> 
> ifeq ($(BR2_PACKAGE_UTIL_LINUX),y)
> XAPP_XINIT_CONF_OPT += MCOOKIE=/usr/bin/mcookie
> endif
> 
>   Care to make a patch?

We also have a mcookie package in package/x11r7/mcookie/. I guess the
purpose was to avoid building the entire util-linux stuff just to get
mcookie. Maybe we need to decide whether we want to use one mcookie
solution (the standalone package) or the other (mcookie built as part
of util-linux), and stick to it. No?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
