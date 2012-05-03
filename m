From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 May 2012 08:52:56 +0200
Subject: [Buildroot] [PATCH] Package proposed: read-edid
In-Reply-To: <20120503051820.GA20002@sapphire.tkos.co.il>
References: <CADiAo4KJqO8oC+x8mwKoYWKiFf7wSdOfNfO3LPQgREvkLQwAvg@mail.gmail.com>
 <20120503051820.GA20002@sapphire.tkos.co.il>
Message-ID: <20120503085256.5876db5c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dimitry,

Thanks for your contribution! Baruch has raised valid points in his
review, I will add one more comment below.

Le Thu, 3 May 2012 08:18:20 +0300,
Baruch Siach <baruch@tkos.co.il> a ?crit :

> +define READ_EDID_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/get-edid $(TARGET_DIR)/bin
> +	$(INSTALL) -D -m 0755 $(@D)/parse-edid $(TARGET_DIR)/bin
> +endef

This should rather be:

+define READ_EDID_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/get-edid $(TARGET_DIR)/usr/bin/get-edid
+	$(INSTALL) -D -m 0755 $(@D)/parse-edid $(TARGET_DIR)/usr/bin/parse-edid
+endef

I.e, you need to repeat the filename in the second argument, and those
non-essential binaries should probably live in usr/bin/ rather than bin/.

Can you take Baruch and my comments into account and post an updated
version?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
