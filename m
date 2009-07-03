From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jul 2009 10:13:37 +0200
Subject: [Buildroot] External toolchain improvements
In-Reply-To: <1246600903.8052.8.camel@coalu.atr>
References: <mailman.0.1246405094.1110.buildroot@busybox.net>
	<1246406073.21132.13.camel@coalu.atr>
	<20090701160513.2ce29151@surf>
	<1246484614.21132.36.camel@coalu.atr>
	<20090702145011.6b9f3fe9@surf> <1246600903.8052.8.camel@coalu.atr>
Message-ID: <20090703101337.7b766edb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 03 Jul 2009 08:01:43 +0200,
Lionel Landwerlin <lionel.landwerlin@openwide.fr> a ?crit :

> /usr/lib/libdl.so: file not recognized: File format not recognized

Arf, libtool crap.

Can you try with

LIBGLIB2_LIBTOOL_PATCH = YES
LIBGLIB2_AUTORECONF = YES

in package/libglib2/libglib2.mk ?

This will try to fix ltmain.sh to workaround cross-compiling issues.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
