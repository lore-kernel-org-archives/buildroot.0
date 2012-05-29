From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 May 2012 23:02:23 +0200
Subject: [Buildroot] [PATCH] ramspeed: new package
In-Reply-To: <1338324518-5281-1-git-send-email-gustavo@zacarias.com.ar>
References: <1338324518-5281-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120529230223.4e833059@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 29 May 2012 17:48:38 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> +define RAMSPEED_BUILD_CMDS
> +	cp -f package/ramspeed/Makefile $(@D); \
> +	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> +		make -C $(@D) $(RAMSPEED_ARCH)
> +endef

Nitpicking: those two commands do not necessarily need to belong to the
shell same command. I.e, you can write it as:

+define RAMSPEED_BUILD_CMDS
+	cp -f package/ramspeed/Makefile $(@D)
+	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		make -C $(@D) $(RAMSPEED_ARCH)
+endef

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
