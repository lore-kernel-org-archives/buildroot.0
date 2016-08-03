From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Aug 2016 14:36:42 +0200
Subject: [Buildroot] host-autoconf fails to build, no m4
In-Reply-To: <CACTZKX4SyndFg8SpZRPz9kJ8guNrVnJL_fjkQt5r9r+5Lqm4Og@mail.gmail.com>
References: <CACTZKX4SyndFg8SpZRPz9kJ8guNrVnJL_fjkQt5r9r+5Lqm4Og@mail.gmail.com>
Message-ID: <20160803143642.49b264a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Aug 2016 14:26:21 +0200, Atilla Filiz wrote:
> I was trying to build some host packages, which depend on automake and
> autoconf, which in turn fail to build.

Which version of Buildroot are you using?

> /home/atilla/hek/buildroot/output/host/usr/bin/m4 simply doesn't exist and

This is not possible:

HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool

so host-autoconf depends on host-m4, so host-m4 *must* have been built
prior to host-autoconf.

> apparently the package m4 has been deprecated.

The *target* variant of m4, yes. The host variant is still there and
available.

Could you pastebin your Buildroot .config file, as well as the *entire*
build output of "make clean all" ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
