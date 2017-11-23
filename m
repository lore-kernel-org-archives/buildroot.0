From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 23 Nov 2017 19:47:11 +0100
Subject: [Buildroot] [PATCH v1] qt5connectivity: fix examples compile
 without Qt gui module
In-Reply-To: <20171122221248.45984b74@windsurf.lan>
References: <20171118204057.1143-1-ps.report@gmx.net>
 <20171122221248.45984b74@windsurf.lan>
Message-ID: <20171123194711.39475fd9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 22 Nov 2017 22:12:48 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Sat, 18 Nov 2017 21:40:57 +0100, Peter Seiderer wrote:
> > Add upstream suggested patch to fix heartrate-server (needs only
> > core and bluetooth modules).
> > 
> > Fixes [1]:
> > 
> >   make[3]: Entering directory `.../build/qt5connectivity-5.9.2/examples/bluetooth'
> >   cd heartrate-server/ && ( test -e Makefile || .../output/host/bin/qmake -o Makefile .../build/qt5connectivity-5.9.2/examples/bluetooth/heartrate-server/heartrate-server.pro ) && /usr/bin/make -f Makefile
> >   Project ERROR: Unknown module(s) in QT: gui
> >   make[3]: *** [sub-heartrate-server-make_first] Error 3
> >   make[3]: Leaving directory `.../build/qt5connectivity-5.9.2/examples/bluetooth'
> > 
> > [1] http://autobuild.buildroot.net/results/387a21fe7fc672e5668b0afddc138cbb7197d234
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...rtrate-server-needs-only-core-and-bluetoo.patch | 32 ++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 package/qt5/qt5connectivity/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch  
> 
> I've applied to master, but after moving the patch to a 5.9.2
> subfolder. Indeed, the build issue, and therefore the patch, only apply
> to Qt 5.9 and not Qt 5.6.

Arg, sorry for messing it up, thanks for fixing it...

Regards,
Peter

> 
> Thanks!
> 
> Thomas
