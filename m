From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 03 Jul 2012 17:28:37 +0200
Subject: [Buildroot] gtk+
In-Reply-To: <20120703111106.7f544276@skate>
References: <1341046722.72419.YahooMailNeo@web160706.mail.bf1.yahoo.com>
 <20120703111106.7f544276@skate>
Message-ID: <1341329317.31903.16.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2012-07-03 at 11:11 +0200, Thomas Petazzoni wrote:

> gtk+ requires:

>  * A toolchain with wide char support and C++ support.
> 
> These dependencies can be found by reading package/libgtk2/Config.in:
> 
> config BR2_PACKAGE_LIBGTK2
>         bool "libgtk2"
> 	[...]
>         depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
>         depends on BR2_USE_WCHAR # glib2
>         depends on BR2_INSTALL_LIBSTDCPP # pango
>         help
>           The GTK+ version 2 graphical user interface library

I don't quite understand why pango needs C++ support though. As far as I
know it is written in plain C. The pango Config.in file refers to
freetype:

        depends on BR2_INSTALL_LIBSTDCPP # freetype support

But freetype itself doesn't depend on C++ support.


Regards,
Sven
