From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 08:19:21 +0200
Subject: [Buildroot] [PATCH] qt5: Disable pkg-config usage for
 cross-building
In-Reply-To: <1474611155.2562.6.camel@synopsys.com>
References: <1474573700-22730-1-git-send-email-abrodkin@synopsys.com>
 <20160922205817.GC3179@free.fr>
 <20160923075722.3dbee0a8@free-electrons.com>
 <1474611155.2562.6.camel@synopsys.com>
Message-ID: <20160923081921.189fd5e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 06:12:44 +0000, Alexey Brodkin wrote:

> > Alexey, have you tried the other approaches I outlined in the thread
> > where the initial discussion took place?  
> 
> Well I don't like removal of pkg-config usage either but...
> Another approach with setting?QMAKE_CFLAGS_ISYSTEM to "" may work as well
> (even thought I haven't tried it yet) but that will mean people using
> buildroot-built toolchain for building their Qt5 apps will see those
> compiler warnings about "wrong" stuff in system headers. In the end that's why
> this "-isystem" was introduced in the first place.

Which warning will they see? I don't quite get why they would see a
warning, and still fail to understand why qmake uses -isystem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
