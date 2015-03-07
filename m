From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 14:42:33 +0100
Subject: [Buildroot] [PATCH V2 1/2] tcl: add support for static builds
In-Reply-To: <1425734562-5312-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1425734562-5312-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150307144233.5ee1db01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Sat, 7 Mar 2015 13:22:41 +0000, Vicente Olivert Riera wrote:

> +ifeq ($(BR2_STATIC_LIBS),y)
> +# Do not build tclsh with dynamic loading support when building it
> +# statically because it needs dlopen() and friends.
> +TCL_CONF_OPTS += --disable-load
> +# Also, build only the binaries and libraries and don't build the
> +# 'packages' because they are shared objects which are intended to be
> +# loaded dynamically.
> +TCL_MAKE_OPTS = binaries libraries
> +TCL_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-binaries install-libraries
> +TCL_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-binaries
> +endif

But, if we don't build the 'packages', is the tcl stuff still useful?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
