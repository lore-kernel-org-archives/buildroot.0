From: Michael Roth <mroth@nessie.de>
Date: Wed, 7 Oct 2009 12:19:10 +0200
Subject: [Buildroot] [PATCH 07/23] qt: remove PKG_CONFIG workaround
In-Reply-To: <20091007114401.16c6df30@surf>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-8-git-send-email-mroth@nessie.de>
	<20091007114401.16c6df30@surf>
Message-ID: <200910071219.18055.mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wednesday 07 October 2009 11:44:01 schrieb Thomas Petazzoni:
> Le Wed,  7 Oct 2009 11:20:30 +0200,
>
> Michael Roth <mroth@nessie.de> a ?crit :
> > At least Qt 4.5.2 is fixed in the meantime and honors PKG_CONFIG.
> > So the PATH workaround is no longer needed.
>
> Ok (if it has been tested, of course), but:
> > -		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
>
> Must be kept for correct operation of pkg-config. Otherwise, paths
> returned by pkg-config will be incorrect.

Sure? I spy on package/Makefile.in which defines (line 238):

	TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
		... \
		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)"

There is no PKG_CONFIG_SYSROOT but PKG_CONFIG_SYSROOT_DIR.


Michael Roth
