From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jul 2012 11:11:06 +0200
Subject: [Buildroot] gtk+
In-Reply-To: <1341046722.72419.YahooMailNeo@web160706.mail.bf1.yahoo.com>
References: <1341046722.72419.YahooMailNeo@web160706.mail.bf1.yahoo.com>
Message-ID: <20120703111106.7f544276@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Zoran,

Could you please post future questions about Buildroot directly on the
mailing list? I'm Cc'ing the list now.

Le Sat, 30 Jun 2012 01:58:42 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :

> I recently read? some answer you put regarding gtkmm question. What make me
> interested in that answer was your declaration: "We already have gtk+ support
> in Buildroot...".
> My question is what should I check in menuconfig to enable gtk+ support ?

gtk+ requires:

 * A graphic backend, either DirectFB or X.org. The DirectFB backend is
   not very well maintained, so I'd say you'll probably have more luck
   with the X.org backend. So you have to enable a X.org server in
   your Buildroot configuration.

 * A toolchain with wide char support and C++ support.

These dependencies can be found by reading package/libgtk2/Config.in:

config BR2_PACKAGE_LIBGTK2
        bool "libgtk2"
	[...]
        depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
        depends on BR2_USE_WCHAR # glib2
        depends on BR2_INSTALL_LIBSTDCPP # pango
        help
          The GTK+ version 2 graphical user interface library

Or by looking at the help text for BR2_PACKAGE_LIBGTK2 in menuconfig.

Hope this helps,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
