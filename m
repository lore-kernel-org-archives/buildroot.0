From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Feb 2018 21:19:22 +0100
Subject: [Buildroot] [RFC v1] libv4l: fix qv4l2 libatomic related
 compile failure
In-Reply-To: <20180206220259.4cd2d00f@gmx.net>
References: <20180203232127.22765-1-ps.report@gmx.net>
 <20180204234301.39188706@windsurf>
 <20180206220259.4cd2d00f@gmx.net>
Message-ID: <20180212211922.12b3be43@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 6 Feb 2018 22:02:59 +0100, Peter Seiderer wrote:

> > 
> > On Sun,  4 Feb 2018 00:21:27 +0100, Peter Seiderer wrote:  
> > > Fixes [1]:
> > > 
> > >   sparc-buildroot-linux-uclibc/bin/ld: qv4l2-qv4l2.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
> > > 
> > > [1] http://autobuild.buildroot.net/results/baa2595e1acdf4e795fbb940ca57fd136c827da3    
> > 
> > Did you analyze what part of the code is using atomic intrinsics? I
> > don't see any use of atomic instrisics in qv4l2 itself (but perhaps I
> > missed them), so they must be somewhere else.  
> 
> The atomic usage comes from the Qt5 libraries (libQt5Core.so,
> libQt5Gui.so and libQt5Widgets.so)...

Isn't Qt installing some .pc files ? Are they being used by libv4l ? If
so, are these .pc files referencing libatomic ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
