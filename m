From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2009 16:41:09 +0200
Subject: [Buildroot] External toolchain improvements
In-Reply-To: <1247513162.8439.10.camel@coalu.atr>
References: <mailman.0.1246405094.1110.buildroot@busybox.net>
	<1246406073.21132.13.camel@coalu.atr>
	<20090701160513.2ce29151@surf>
	<1246484614.21132.36.camel@coalu.atr>
	<20090702145011.6b9f3fe9@surf> <1247513162.8439.10.camel@coalu.atr>
Message-ID: <20090714164109.26df9c81@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lionel,

Le Mon, 13 Jul 2009 21:26:02 +0200,
Lionel Landwerlin <lionel.landwerlin@openwide.fr> a ?crit :

> Just a word about the choice to put the EXTERNAL_LIBS variable in
> toolchain/external-toolchain/ext-tool.mk. I don't think it's a good
> choice. For example, my current toolchain includes a glibc version
> 2.6. This make the ld-linux loader name /lib/ld-linux.so.2 instead
> of /lib/ld-linux.so.3.
> 
> Modifying an enormous variable inside kconfig is painful, but I think
> it's better to let this variable configurable rather than encourage
> the buildroot user to modify an unfriendly makefile
> (toolchain/external-toolchain/ext-tool.mk).

This is also something I've discovered recently. I'd like to spend some
time to see if it's still possible to auto-detect the version of the
libraries to copy. If it doesn't work, then I fallback to the previous
solution, which I don't find really nice.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
