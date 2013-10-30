From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:18:59 +0100
Subject: [Buildroot] [PATCH 5/5] util-linux: Fix cross-compile for
 host-util-linux when ncurses not selected
In-Reply-To: <1383164412-20657-5-git-send-email-olivier.schonken@gmail.com>
References: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
 <1383164412-20657-5-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20131030221859.0e7f43f6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Wed, 30 Oct 2013 22:20:12 +0200, Olivier Schonken wrote:

> +ifeq ($(BR2_PACKAGE_NCURSES),y)
> +HOST_UTIL_LINUX_DEPENDENCIES += ncurses
> +else
> +HOST_UTIL_LINUX_CONF_OPT += --without-ncurses
> +endif

This cannot be correct. BR2_PACKAGE_NCURSES tells whether ncurses is
enabled for the target, but you're using that to decide how to
configure the host util-linux.

Since I believe we most likely don't need ncurses support at all in the
host util-linux, we can unconditionally add a --without-ncurses to
HOST_UTIL_LINUX_CONF_OPT. Could you resend an updated patch that
implements this?

Also, it would be good if you could improve the commit log by adding
the relevant piece of build log containing the util-linux configure
error.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
