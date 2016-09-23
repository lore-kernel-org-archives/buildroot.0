From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 23 Sep 2016 07:28:11 +0000
Subject: [Buildroot] [PATCH] qt5: Disable pkg-config usage for
 cross-building
In-Reply-To: <20160923081921.189fd5e4@free-electrons.com>
References: <1474573700-22730-1-git-send-email-abrodkin@synopsys.com>
 <20160922205817.GC3179@free.fr>
 <20160923075722.3dbee0a8@free-electrons.com>
 <1474611155.2562.6.camel@synopsys.com>
 <20160923081921.189fd5e4@free-electrons.com>
Message-ID: <1474615682.2562.11.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2016-09-23 at 08:19 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 23 Sep 2016 06:12:44 +0000, Alexey Brodkin wrote:
> 
> > 
> > > 
> > > Alexey, have you tried the other approaches I outlined in the thread
> > > where the initial discussion took place???
> > 
> > Well I don't like removal of pkg-config usage either but...
> > Another approach with setting?QMAKE_CFLAGS_ISYSTEM to "" may work as well
> > (even thought I haven't tried it yet) but that will mean people using
> > buildroot-built toolchain for building their Qt5 apps will see those
> > compiler warnings about "wrong" stuff in system headers. In the end that's why
> > this "-isystem" was introduced in the first place.
> 
> Which warning will they see? I don't quite get why they would see a
> warning,

I don't have an example handy but maybe this sheds some light on that
https://gcc.gnu.org/onlinedocs/cpp/System-Headers.h
tml?

> and still fail to understand why qmake uses -isystem.

Again I would assume that's to mute warnings that have nothing to
do with Qt itself or user's code.

-Alexey
