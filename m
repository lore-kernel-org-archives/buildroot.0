From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Feb 2011 22:02:38 +0100
Subject: [Buildroot] [PATCH] Add package bonnie++
In-Reply-To: <1296580740-4790-1-git-send-email-mort@bork.org>
References: <1296580740-4790-1-git-send-email-mort@bork.org>
Message-ID: <20110201220238.2c218fcd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Feb 2011 12:19:00 -0500
Martin Hicks <mort@bork.org> wrote:

> A good filesystem performance benchmark program
> 
> Signed-off-by: Martin Hicks <mort@bork.org>

Thanks for this package. Some comments below.

> +config BR2_PACKAGE_BONNIE
> +	bool "bonnie++"
> +	help
> +          Filesystem tester

Here the indent should be one tab + two spaces.

> +BONNIE_VERSION = 1.03e
> +BONNIE_SOURCE = bonnie++-$(BONNIE_VERSION).tgz
> +BONNIE_SITE = http://www.coker.com.au/bonnie++/
> +BONNIE_INSTALL_TARGET_OPT = INSTALL="install -m 0755" install-bin

This is not needed if you override the installation as done below by
BONNE_INSTALL_TARGET_CMDS.

> +define BONNIE_INSTALL_TARGET_CMDS
> +	install -D -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin

should be

install -D -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin/bonnie++

> +	install -D -m 755 $(@D)/zcav $(TARGET_DIR)/usr/sbin

should be

install -D -m 755 $(@D)/zcav $(TARGET_DIR)/usr/sbin/zcav

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
