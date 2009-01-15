From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 22:43:08 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/kismet
In-Reply-To: <871vv5asku.fsf@macbook.be.48ers.dk>
References: <20090114235133.4391B7697C@busybox.osuosl.org>
	<871vv5asku.fsf@macbook.be.48ers.dk>
Message-ID: <1232055788.4757.49.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-15 klockan 09:20 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-14 23:51:32 +0000 (Wed, 14 Jan 2009)
>  ulf> New Revision: 24849
> 
>  ulf> Log:
>  ulf> Kismet needs dbus to build
> 
> What about dbus_glib?
> 
> Config.in has:
> 
>         select BR2_PACKAGE_NCURSES
>         select BR2_PACKAGE_LIBPCAP
>         select BR2_PACKAGE_DBUS
>         select BR2_PACKAGE_DBUS_GLIB
> 



Not sure it is needed.
Currently libglib2 is broken for me, which breaks the dbus-glib
build as well.

Kismet completes the build anyway.

http://www.kismetwireless.net/documentation.shtml notes:
Kismet is an 802.11 layer2 wireless network detector, sniffer, and
intrusion detection system

dbus is OPTIONAL and is needed for "networkmanager" control.

Maybe the select statement(s) above are wrong?

BR
Ulf Samuelsson.
