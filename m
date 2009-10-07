From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 11:44:01 +0200
Subject: [Buildroot] [PATCH 07/23] qt: remove PKG_CONFIG workaround
In-Reply-To: <1254907246-5650-8-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-8-git-send-email-mroth@nessie.de>
Message-ID: <20091007114401.16c6df30@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:30 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> At least Qt 4.5.2 is fixed in the meantime and honors PKG_CONFIG.
> So the PATH workaround is no longer needed.

Ok (if it has been tested, of course), but:

> -		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \

Must be kept for correct operation of pkg-config. Otherwise, paths
returned by pkg-config will be incorrect.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
