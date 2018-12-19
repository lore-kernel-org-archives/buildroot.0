From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 19 Dec 2018 22:15:31 +0100
Subject: [Buildroot] [PATCH 1/1] connman: fix systemd build wih pkgconf
 1.5.3
In-Reply-To: <20181216102909.32124-1-fontaine.fabrice@gmail.com>
References: <20181216102909.32124-1-fontaine.fabrice@gmail.com>
Message-ID: <20181219211529.GA812@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file. This is correct when the paths refer to
> something in STAGING_DIR (e.g. libdir, includedir), but not when it
> refers to something used for the target.

> connman uses the tmpfilesdir variable from systemd.pc to decide where to
> install things. Since DESTDIR is prepended to the install destination,
> this will end up in the wrong location.

> Until a better solution is found in pkgconf, pass the tmpfilesdir to use
> explicitly instead of relying on systemd.pc.

> Fixes:
>  - http://autobuild.buildroot.org/results/6a13e6dfc58b2b3f8fbad6d6d6462370a75a8ad4

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for your fix!


Kind regards,
Petr
