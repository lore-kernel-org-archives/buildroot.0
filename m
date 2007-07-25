From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 26 Jul 2007 00:39:34 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
In-Reply-To: <20070725173927.E0BE0A5E25@busybox.net>
References: <20070725173927.E0BE0A5E25@busybox.net>
Message-ID: <20070725223934.GB11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 25, 2007 at 10:39:27AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-25 10:39:26 -0700 (Wed, 25 Jul 2007)
>New Revision: 19261
>
>Log:
>Make SDL seled DirectFB
>
>Modified:
>   trunk/buildroot/package/sdl/Config.in
>
>
>Changeset:
>Modified: trunk/buildroot/package/sdl/Config.in
>===================================================================
>--- trunk/buildroot/package/sdl/Config.in	2007-07-25 17:37:50 UTC (rev 19260)
>+++ trunk/buildroot/package/sdl/Config.in	2007-07-25 17:39:26 UTC (rev 19261)
>@@ -1,6 +1,7 @@
> config BR2_PACKAGE_SDL
> 	bool "SDL"
> 	default n
>+	select BR2_PACKAGE_DIRECTFB

Why? It's perfectly fine to build SDL without
a) FB support (any FB support)
b) with the stock FB (no directfb)

If you want directfb and directfb-support, the you should select it
manually, no?
