From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Jan 2012 11:18:04 +0100
Subject: [Buildroot] Buildroot source directory
In-Reply-To: <DUB105-W14CD6E2D85878E0DB9DBD8CD940@phx.gbl>
References: <DUB105-W14CD6E2D85878E0DB9DBD8CD940@phx.gbl>
Message-ID: <20120105111804.0e3d6d80@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please fix your mailer, the text version it's sending is badly wrapped.

Le Thu, 5 Jan 2012 12:47:50 +0300,
Janne H?meenaho <jannehameenaho@hotmail.com> a ?crit :

> I've got a Buildroot makefile issue with Mercurial repository. Here's the makefile that get's the whole repository, but this prodtest module needs only /my-device/prodtest folder. How do I show Buildroot to use that folder? I don't mind that the whole repo comes along to tar, I just want to use that certain subfolder.
> ############################################################### prodtest##############################################################PRODTEST_VERSION    = defaultPRODTEST_SITE_METHOD = hgPRODTEST_SITE	   = http://hg.my.lan/trunk/my-device
> define PRODTEST_BUILD_CMDS
> 	$(MAKE) -C $(@D) 			\		CC="$(TARGET_CROSS)"		\					endef

Use:

	$(MAKE) -C $(@D)/prodtest

Does that answer your question?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
