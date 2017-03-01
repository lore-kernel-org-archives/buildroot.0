From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 1 Mar 2017 22:58:56 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/supertux: new package
In-Reply-To: <20170228232453.3550-2-romain.naour@gmail.com>
References: <20170228232453.3550-1-romain.naour@gmail.com>
 <20170228232453.3550-2-romain.naour@gmail.com>
Message-ID: <1e71bddf-1c31-12c4-8aab-88e8b9111d69@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 01/03/2017 ? 00:24, Romain Naour a ?crit :
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---

snip

> +# Most of the data subdirectory is licensed under CC-by-SA, see
> +# data/AUTHORS for a full list.
> +# Supertux itself is GPLv3+, but it bundles a few libraries with different
> +# licenses. PhysFS, sexp-cpp, squirrel, tinygettext.
> +SUPERTUX_LICENSE = GPLv3+, CC-BY-SA (images music sounds)
> +SUPERTUX_LICENSE_FILES = LICENSE.txt data/AUTHORS

data/AUTHORS provide a license for almost each data file, each license may be
CC-BY-SA and GPL version 2 or later or CC-BY-SA 4.0 or CC-BY 3.0/CC-BY-SA
3.0/GPL 3.0 etc...

So It's not an exhaustive list of licenses. Should I list all licenses present
in this file ?

> +
> +# Use bundled squirrel, tinygettext sexp-cpp packages which are hardcoded in
> +# the CMake build system. Also use bundled PhysFS since there is no Buildroot
> +# package for it.
> +SUPERTUX_DEPENDENCIES = host-pkgconf boost libcurl libgl libglew libglu \
> +	libogg libvorbis openal sdl2 sdl2_image

I'm working on PhysFS package and see if it can be used by supertux.
This is the only library that can be used as "system" library (i.e from staging).

Best regards,
Romain
