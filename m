From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 1 Nov 2008 12:47:25 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <20081031171723.6F149F8055@busybox.net>
References: <20081031171723.6F149F8055@busybox.net>
Message-ID: <200811011247.26080.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

antab at uclibc.org, 31.10.2008:
> Author: antab
> Date: 2008-10-31 10:17:23 -0700 (Fri, 31 Oct 2008)
> New Revision: 23886
> 
> Log:
> Add options to select what gfx and mouse drivers are compiled in.
> Note to tslib users: You now have to select the tslib mouse driver to build it.
> 
> 
> Added:
>    trunk/buildroot/package/qtopia4/Config.gfx.in
>    trunk/buildroot/package/qtopia4/Config.mouse.in
> 
> Modified:
>    trunk/buildroot/package/qtopia4/Config.in
>    trunk/buildroot/package/qtopia4/Config.sql.in
>    trunk/buildroot/package/qtopia4/qtopia4.mk

Just some comments:

> +config BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN
> +	bool "multiscreen"
> +	default y

I don't know what the multiscreen driver is about, sounds like multiple
physical screens. Is this a common setup that you default to y here?

> +config BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX
> +	bool "vxr41xx"

vr41xx

> +	default n

is not necessary in all the options

> Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
> +### Mouse drivers

MOUSE_QVFB is missing here.


I could also make a patch, but I wanted to clarify the multiscreen thing
first.

Markus
