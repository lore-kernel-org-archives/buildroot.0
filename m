From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 15:51:33 +0200
Subject: [Buildroot] [PATCH] [RFC] system: add option to choose what
	/bin/sh points to
In-Reply-To: <1413120982-19635-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 12 Oct 2014 15:36:22 +0200")
References: <1413120982-19635-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87oathxuoq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Not all our shells do install a pointer to /bin/sh. Besides, between
 > those that do and multiple ones are enabled, the last one to install
 > wins the the symlink.

 > Add a new config choice in the system sub-menu that allows the user to
 > explicitly select the shell to provide /bin/sh. If busybox is not
 > enabled, default to using dash, a POSIX shell.

 > Remove the symlink creation from bash.mk at the same time.

 > Note: for every shell, we select them, except busybox, on which we
 > depend, on the assumption that we do not want to force busybox in case
 > the user decided not to enable it.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - default to dash if busybox is disabled

 > +config BR2_SYSTEM_BIN_SH_BASH
 > +	bool "bash"
 > +	depends on BR2_USE_MMU # bash
 > +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || !BR2_PACKAGE_BUSYBOX
 > +	select BR2_PACKAGE_BASH
 > +
 > +config BR2_SYSTEM_BIN_SH_DASH
 > +	bool "dash"
 > +	depends on BR2_USE_MMU # dash
 > +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || !BR2_PACKAGE_BUSYBOX
 > +	select BR2_PACKAGE_DASH

You forgot to remove the redundant || !BR2_PACKAGE_BUSYBOX.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
