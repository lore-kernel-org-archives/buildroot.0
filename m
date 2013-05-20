From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 May 2013 16:49:05 +0200
Subject: [Buildroot] [PATCH] ed: Convert to generic package
 infrastructure
In-Reply-To: <1369056118-32503-1-git-send-email-markos.chandras@gmail.com>
References: <1369056118-32503-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <20130520164905.1b5c9ac5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Mon, 20 May 2013 14:21:58 +0100, Markos Chandras wrote:

> -$(eval $(autotools-package))
> +define ED_CONFIGURE_CMDS
> +	( cd $(@D); \

Nitpick: we typically don't put a space here.

> +		./configure \
> +		--prefix=/usr \
> +		CPPFLAGS="$(TARGET_CPPFLAGS)" \
> +		CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> +		CC="$(TARGET_CC)" \

Maybe you could use $(TARGET_CONFIGURE_OPTS) here instead?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
