From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jun 2013 12:16:25 +0200
Subject: [Buildroot] binutils doesn't like -elf2flt option
In-Reply-To: <kps03n$e9p$1@ger.gmane.org>
References: <kphffs$v5g$1@ger.gmane.org> <51BEAB3A.8010408@mind.be>
 <kpmcpb$lbo$1@ger.gmane.org> <51C08403.4050900@mind.be>
 <kpqg93$v74$1@ger.gmane.org> <20130619082557.447efce8@skate>
 <kprol2$uk1$1@ger.gmane.org> <20130619102133.7570dcd4@skate>
 <kprv8d$6iq$1@ger.gmane.org> <20130619120616.447be089@skate>
 <kps03n$e9p$1@ger.gmane.org>
Message-ID: <20130619121625.3a47c45e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam Nielsen,

On Wed, 19 Jun 2013 20:11:09 +1000, Adam Nielsen wrote:

> >> Getting targets
> >> Getting dependencies for ['elf2flt', 'ncurses', 'zlib', 'nano', 'busybox',
> >> 'linux', 'rootfs-romfs', 'rootfs-tar', 'rootfs-cpio', 'rootfs-initramfs',
> >> 'rootfs-squashfs']
> >> Error getting dependencies ['elf2flt', 'ncurses', 'zlib', 'nano', 'busybox',
> >> 'linux', 'rootfs-romfs', 'rootfs-tar', 'rootfs-cpio', 'rootfs-initramfs',
> >> 'rootfs-squashfs']
> >>
> >> So I'm not sure whether I need to do something differently?
> >
> > What does the output PDF looks like?
> 
> I can't generate the PDF, the dep.dot file is zero bytes.  I'm guessing 
> graph-depends gives up when it reports that error message.

Ah, right, elf2flt isn't a real package, so it fails.

Can you push your current Buildroot code on some Git repository so that
we can have a look? I looked at your configuration, and I really don't
see what could be pulling the target binutils into the build.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
