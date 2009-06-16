From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue, 16 Jun 2009 10:38:04 +0200
Subject: [Buildroot] [PATCHES] device-mapper is now included in LVM2
In-Reply-To: <4A365D42.5000006@lbsd.net>
References: <4A365BDB.5070106@lbsd.net>
	<87a5b0800906150740j19684f5ft3de5e7b0adfa5b1b@mail.gmail.com>
	<4A365D42.5000006@lbsd.net>
Message-ID: <20090616103804.639700ab@bandomeer.europe.flane.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jun 2009 14:40:02 +0000
Nigel Kukard <nkukard@lbsd.net> wrote:

> 
> > I think this should close bug 241?
> >
> > https://bugs.busybox.net/show_bug.cgi?id=241
> >   
> 
> Yep ... lets just wait a day or so and see if everyone is happy  :)

Why no conversion to Makefile.autotools.in?

The clean target is not working:
> lvm2-clean:
> 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LVM2_DIR) uninstall
make[1]: Entering directory `/home/development/buildroot/build_i586/LVM2.2.02.47'
make[1]: *** No rule to make target `uninstall'.  Stop.
make[1]: Leaving directory `/home/development/buildroot/build_i586/LVM2.2.02.47'

I've attached an updated version of my patch (against current HEAD) which 
doesn't use post_install_hooks for stripping the binaries. Seems to be cleaner.

Regards
Olaf
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-device-mapper-lvm2-build-together-take-2.patch
Type: text/x-patch
Size: 14818 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090616/44dfb648/attachment-0001.bin>
