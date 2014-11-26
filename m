From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:26:07 +0100
Subject: [Buildroot] [PATCH v2] samba: Add support for libnss_win*.so*
 installation
In-Reply-To: <1416960016-5956-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1416960016-5956-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20141126222607.4c57066e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Wed, 26 Nov 2014 01:00:15 +0100, Beno?t Th?baudeau wrote:
> The libnss_wins and libnss_winbind libraries are required in order to
> add support for the wins and winbind sources to the Name Service Switch
> (NSS), so make it possible to install them. This is useful in order to
> resolve NetBIOS names or user and group information from a Windows NT
> server.
> 
> These libraries are installed to /lib/ like the standard libnss_*
> libraries from (E)GLIBC.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>

Applied to next. One question, though.


> +ifeq ($(BR2_PACKAGE_SAMBA_LIBNSS_WINS),y)
> +define SAMBA_INSTALL_LIBNSS_WINS
> +	# install libnss_wins
> +	$(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_wins.so $(TARGET_DIR)/lib/libnss_wins.so
> +	ln -snf libnss_wins.so $(TARGET_DIR)/lib/libnss_wins.so.2

This dance is a bit weird. Normally, it's the opposite that is done:
the .so.X is the real file, and the .so is a symbolic link. Any reason
to do it the way you did it?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
