From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 12:11:06 +0100
Subject: [Buildroot] [PATCH] bootstrap: new package
In-Reply-To: <1420838018-2511-1-git-send-email-yegorslists@googlemail.com>
References: <1420838018-2511-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150110121106.404c39cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Fri,  9 Jan 2015 22:13:38 +0100, Yegor Yefremov wrote:

> +define BOOTSTRAP_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/var/www/bootstrap
> +	$(TAR) c -C $(@D) dist |  \
> +		$(TAR) x -C $(TARGET_DIR)/var/www/bootstrap --strip-components=1

This is really a convoluted way of doing:

	cp -dpfr $(@D)/dist/* $(TARGET_DIR)/var/www/bootstrap/

so I've changed to use that instead, and applied.

However, can you submit a follow-up patch to remove the unneeded files
from the target? Or copy only the ones that are used? Both the full JS
and CSS files are added, in addition to the minimized ones, I don't
think that's useful. I'm also not sure what the big .css.map file is.

Can you look into this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
