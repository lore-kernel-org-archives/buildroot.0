From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Jan 2019 10:41:37 +0100
Subject: [Buildroot] [PATCH 2/2] atk: bump to version 2.30.0
In-Reply-To: <20181203073043.21021-2-fontaine.fabrice@gmail.com>
References: <20181203073043.21021-1-fontaine.fabrice@gmail.com>
 <20181203073043.21021-2-fontaine.fabrice@gmail.com>
Message-ID: <20190102104137.74794175@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 08:30:43 +0100, Fabrice Fontaine wrote:
> - Switch to meson-package
> - Remove ATK_INSTALL_STAGING_OPTS and host-pkgconf: not needed anymore
> - Add hash for license file
> - This bump fix the issue with glib 2.58.1 (because meson does not use
>   pkgconfig to find glib-genmarshal):
>   /bin/bash: /usr/bin/glib-genmarshal: No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/23cf5227c21365cda0babf1922425f8adaa97fba

This causes a build failure in BR2_STATIC_LIBS=y configurations. Seems
like the meson build system always wants to build a dynamic library:

  http://autobuild.buildroot.net/?reason=atk-2.30.0

Rather than adding a !BR2_STATIC_LIBS dependency, it would be nice to
teach meson to build only a static library.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
