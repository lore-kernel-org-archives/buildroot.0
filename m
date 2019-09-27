From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 27 Sep 2019 08:43:39 +0200
Subject: [Buildroot] Libtirpc upstream responding again
Message-ID: <20190927064338.GB21906@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

libtirpc upstream is now responding (thanks to Steve Dickson from Red Hat).

They accepted Thomas's patch
0002-uClibc-without-RPC-support-and-musl-does-not-install-rpcent.h.patch,
I've sent 0006-rpc-types.h-fix-musl-build.patch [1] (this one with correct author)

I guess 0003-Automatically-generate-XDR-header-files-from-.x-sour.patch
0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch are useful as
well for upstream. I'd expect they should be used together (maybe even squashed),
but applying them both I get:
make: *** No rule to make target 'tirpc/rpcsvc/mount.x', needed by 'tirpc/rpcsvc/mount.h'.  Stop.

Would you dear to sent prober patch to upstream?

I also plan to rework these and send upstream (unless you plan to do it
yourself):
* 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
revork to support as an configure option

* 0005-Disable-DES-authentification-support.patch
revork to detect if DES is available

Kind regards,
Petr

[1] https://sourceforge.net/p/libtirpc/mailman/message/36772634/
