From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2009 22:17:17 +0200
Subject: [Buildroot] buildroot-libtool.patch failed with dbus 1.3.0
In-Reply-To: <4A7C85F0.7070604@eclis.ch>
References: <4A7C85F0.7070604@eclis.ch>
Message-ID: <20090807221717.53039a10@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 07 Aug 2009 21:52:16 +0200,
Jean-Christian de Rivaz <jc@eclis.ch> a ?crit :

> If I understand correctly, buildroot have a script
> package/Makefile.autotools.in that try to patch the ltmain.sh for his
> specific need. How can I disable or fix this ?

You can disable it by adding DBUS_LIBTOOL_PATCH = NO in dbus/dbus.mk.

However, libtool will not be patched anymore, so depending on the
version of libtool being used in dbus-1.3.0, it might break the build.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
