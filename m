From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jul 2010 15:49:39 +0200
Subject: [Buildroot] makedevs: line 49: regular file (...)
 buildroot/output/target/usr/share/udhcpc/default.script does not exist: No
 such file or directory
In-Reply-To: <1280151165.31502.6.camel@segulix>
References: <1280116089.28885.29.camel@segulix> <20100726082816.7a1bd8d1@surf>
	<1280151165.31502.6.camel@segulix>
Message-ID: <20100726154939.6a80081d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Jul 2010 14:32:45 +0100
Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> wrote:

> > On Mon, 26 Jul 2010 04:48:09 +0100
> > Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> wrote:
> > 
> > > I got this error too , with buildroot-2010.05.
> > 
> > Which error ?
> 
> Well error is in subject (Can't get Buildrooot to finish):

Aah, okay, I missed it.

> makedevs: line 49: regular file (...)
> buildroot/output/target/usr/share/udhcpc/default.script does not
> exist: No such file or directory

Can you post your Buildroot .config for us to reproduce the issue ?

> > > After read some threads in this mailing list is this some error , 
> > > to work around I done:
> > > cd output/target/usr/share
> > > ln -s ../../../../target/generic/target_skeleton/usr/share/udhcpc
> > > 
> > > and build rootfs , is this correct ? the target is a mips32r2 . 
> > 
> > Maybe, but as you haven't copy/pasted the error, it's hard to
> > say :-)

In fact, the work around is not correct. You're creating a symbolic
link from the target directory to the outside. While this symbolic may
work on the development system where Buildroot runs, it will miserably
fail on the target system.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
