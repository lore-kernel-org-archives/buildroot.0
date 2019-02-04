From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Feb 2019 10:32:10 +0100
Subject: [Buildroot] [RFC v1] libv4l: fix qv4l2 libatomic related
 compile failure
In-Reply-To: <20180212211922.12b3be43@windsurf.lan>
References: <20180203232127.22765-1-ps.report@gmx.net>
 <20180204234301.39188706@windsurf>
 <20180206220259.4cd2d00f@gmx.net>
 <20180212211922.12b3be43@windsurf.lan>
Message-ID: <20190204093210.GA17819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-02-12 21:19 +0100, Thomas Petazzoni spake thusly:
> On Tue, 6 Feb 2018 22:02:59 +0100, Peter Seiderer wrote:
> > > On Sun,  4 Feb 2018 00:21:27 +0100, Peter Seiderer wrote:  
> > > > Fixes [1]:
> > > > 
> > > >   sparc-buildroot-linux-uclibc/bin/ld: qv4l2-qv4l2.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
> > > > 
> > > > [1] http://autobuild.buildroot.net/results/baa2595e1acdf4e795fbb940ca57fd136c827da3    
> > > 
> > > Did you analyze what part of the code is using atomic intrinsics? I
> > > don't see any use of atomic instrisics in qv4l2 itself (but perhaps I
> > > missed them), so they must be somewhere else.  
> > 
> > The atomic usage comes from the Qt5 libraries (libQt5Core.so,
> > libQt5Gui.so and libQt5Widgets.so)...
> 
> Isn't Qt installing some .pc files ? Are they being used by libv4l ? If
> so, are these .pc files referencing libatomic ?

So, this 1 year old patch is still pending, and you did not reply to
Thomas questiiiion about using the .pc files from Qt.

I've marked this patch as changes-requested in patchwork. If you believe
something is still needed, can you please respin an updated patch that
takes into account Thomas' comments.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
