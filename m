From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Mar 2014 20:20:25 +0100
Subject: [Buildroot] [PATCH 1/1] jquery-mobile : new package
In-Reply-To: <1393781646-2497-1-git-send-email-sagaert.johan@skynet.be>
References: <1393781646-2497-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140305202025.640405f8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun,  2 Mar 2014 18:34:06 +0100, Sagaert Johan wrote:
> jQuery Mobile is a HTML5-based user interface system designed to make
> responsive web sites and apps that are accessible on all smartphone,
> tablet and desktop devices.
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

This looks good, except one thing:

> +ifeq ($(BR2_PACKAGE_JQUERY_MOBILE_DEMOS),y)
> +define JQUERY_MOBILE_INSTALL_DEMOS
> +	mkdir -p $(TARGET_DIR)/var/www/demos
> +	cp -r $(@D)/demos/* $(TARGET_DIR)/var/www/demos
> +	$(INSTALL) -m 0644 -D $(@D)/demos/index.html $(TARGET_DIR)/var/www/demo.html

Does this work? I mean the index.html file in the demos/ directory is
meant to stay there: it has relative paths to the subdirectories in the
demos/ directory. So if you move only this file from /var/www/demos
to /var/www I'm not sure to understand how it can work.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
