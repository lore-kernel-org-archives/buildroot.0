From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Nov 2012 19:28:47 +0100
Subject: [Buildroot] [PATCH] busybox: needs linux-pam dependency added
 if using custom busybox .config & busybox login applet
In-Reply-To: <50A92459.1070404@petroprogram.com>
References: <1353197713-20796-1-git-send-email-stefan.froberg@petroprogram.com>
 <20121118174000.0fe79ef6@skate> <50A91D44.5060104@petroprogram.com>
 <20121118184849.660aad23@skate> <50A92459.1070404@petroprogram.com>
Message-ID: <20121118192847.54784644@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Sun, 18 Nov 2012 20:09:29 +0200, Stefan Fr?berg wrote:

> > ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> > BUSYBOX_DEPENDENCIES += linux-pam
> > BUSYBOX_CFLAGS += -DENABLE_PAM
> > endif

Hum, wait, I didn't see there was a CONFIG_PAM option. So what you want
to do is:

ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
BUSYBOX_DEPENDENCIES += linux-pam
endif

And then, in the Busybox configuration step, do:

ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
	$(call KCONFIG_SET_OPT,CONFIG_PAM,/path/to/busybox/config/file)
endif

or something along those lines.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
