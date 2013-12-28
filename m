From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 13:02:04 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-12-27
In-Reply-To: <20131228115043.GB3373@free.fr>
References: <20131228073009.0C3D910103D@stock.ovh.net>
 <20131228102610.GA3373@free.fr> <20131228124239.5832b6d9@skate>
 <20131228115043.GB3373@free.fr>
Message-ID: <20131228130204.3c2e9356@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 28 Dec 2013 12:50:43 +0100, Yann E. MORIN wrote:

> On 2013-12-28 12:42 +0100, Thomas Petazzoni spake thusly:
> > On Sat, 28 Dec 2013 11:26:10 +0100, Yann E. MORIN wrote:
> > > On 2013-12-28 08:30 +0100, Thomas Petazzoni spake thusly:
> > > > Detail of failures
> > > >    powerpc |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/c21fdc2b4e6564e4d557380e5e86aba0d78f1364/
> > > 
> > > Too old kernel headers, should be fixed by an exception on the
> > > autobuilders.
> > I added the exception to the autobuilders yesterday.
> 
> Ok, thanks! Ditto for tvheadend?

Yes.

> > > >    powerpc |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/1f5c0689ae129ae5fa30f31a4f47ccbd7705ff00/
> > > >    powerpc |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/1729043d9c977a59a4fdd7ccd3d16cfc8aef7678/
> > > >    powerpc |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/3ab080e96576e0012fea853009811247338e665e/
> > > 
> > > Can not find python-argparse. I'll check this.
> > 
> > Maybe just disable Python support in libevdev or something like that.
> 
> Since python is a mandatory dependency, I guess Peter and you must be
> using quite an old distribution on your autobuilders, since argparse is
> built-in on Python 2.7 and above.

Yes, the distros we're using are generally quite old.

> But I'll see if we can disable python support in libevdev, or make it
> depend on {host-,}python as needed.

The Python stuff is used to generate a header file. One solution is to
simply add a patch that contains the pre-generated version of this
header file. But well, maybe depending on host-python is easier and
more future-proof.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
