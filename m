From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Oct 2012 18:01:21 +0200
Subject: [Buildroot] [gpsd-users] Getting ready to ship 3.8
In-Reply-To: <20121023153611.GA23214@thyrsus.com>
References: <20121023145349.EFC1940659@snark.thyrsus.com>
 <20121023170913.7f5d701f@skate>
 <20121023153611.GA23214@thyrsus.com>
Message-ID: <20121023180121.62a97995@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric S. Raymond,

On Tue, 23 Oct 2012 11:36:11 -0400, Eric S. Raymond wrote:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> >  * First issue is that we still support Python 2.5 based hosts,
> > while the current SCons based gpsd build system makes some
> > assumption about Python 2.6 being available. This requires three
> > patches:
> > 
> >    http://git.buildroot.net/buildroot/plain/package/gpsd/gpsd-01-sconstruct-python-2.5-compat.patch
> >    http://git.buildroot.net/buildroot/plain/package/gpsd/gpsd-04-sconstruct-python-2.5-compat-distro-check.patch
> >    http://git.buildroot.net/buildroot/plain/package/gpsd/gpsd-05-fix-leapsecond-script-python2.5.patch
> 
> I have merged these.

Great, thanks! Looking forward to bump our gpsd version to 3.8 and get
rid of those patches.

> >  * Second issue is that gpsd hardcodes a runtime library path
> > (RPATH) in its libraries, which when cross-compiling means that
> > paths of the build machine are leaked into the target machine. So
> > we have a simple patch that disables the RPATH usage:
> > 
> >    http://git.buildroot.net/buildroot/plain/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
> 
> This, absolutely not.  Investigate setting chrpath=no.

Indeed, will have a look. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
