From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 23:25:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/owfs: enable back php
In-Reply-To: <20200315102111.2731422-1-fontaine.fabrice@gmail.com>
References: <20200315102111.2731422-1-fontaine.fabrice@gmail.com>
Message-ID: <20200315232546.0e59a362@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Mar 2020 11:21:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +# $(libdir) is set to $(EXTENSION_DIR) which is patched in php.mk to add
> +# $(TARGET_DIR) so remove $(DESTDIR) to avoid an install failure

I guess you're referring to:

+       $(SED) "/extension_dir/ s:/usr:$(TARGET_DIR)/usr:" \
+               $(STAGING_DIR)/usr/bin/php-config

in php.mk ?

Is this the correct thing to do ? Do we have a better solution ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
