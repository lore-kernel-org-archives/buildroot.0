From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 2 May 2011 01:51:31 -0400
Subject: [Buildroot] Buildroot to generate config.site for Autotools
	packages?
In-Reply-To: <BANLkTimC6da=OB2TL=QWj8-ufX7ttdfNmQ@mail.gmail.com>
References: <BANLkTimC6da=OB2TL=QWj8-ufX7ttdfNmQ@mail.gmail.com>
Message-ID: <BANLkTimN9m0pa0xUi9iKGNq9xY5yYAtebw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/5/2 Daniel Nystr?m:
> Just found this:
> http://www.gnu.org/software/hello/manual/autoconf/Site-Defaults.html
>
> Maybe that's a preferable alternative to configure Autotools packages,
> than the large set in _CONF_ENV?
>
> Anyone got any experience from a config.site files?

it's simply a file that gets sourced by the configure script.  export
the CONFIG_SITE env var to the path to the file.

i run a small bit of code to automatically generate a config.site file
from the active toolchain:
http://blackfin.uclinux.org/gf/project/uclinux-dist/scmsvn/trunk/tools/autotools-cache/
-mike
