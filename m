From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 30 Jan 2009 10:47:11 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <1233272247.4147.65.camel@elrond.atmel.com>
References: <20090127125650.GA18250@cloud.net.au>
	<D4FF4B0197F54EE4BC14E179A2F17F15@aeglos>
	<20090129230904.GA13929@cloud.net.au>
	<1233272247.4147.65.camel@elrond.atmel.com>
Message-ID: <20090129234711.GA15229@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 30, 2009 at 12:37:27AM +0100, Ulf Samuelsson wrote:
> fre 2009-01-30 klockan 10:09 +1100 skrev Hamish Moffatt:
> > On Thu, Jan 29, 2009 at 03:33:08PM +0100, Ulf Samuelsson wrote:
> > >> The current logic of trying xconfig then menuconfig is very ugly - does
> > >> it allow you to abort xconfig without falling back?
> > >
> > > If you could abort the xconfig without running menuconfig,
> > > then you would not have a config file and the build would abort.
> > > What is the sense of that?
> > 
> > You could have an exising config, start editing then change your mind.
> > You don't want menuconfig to launch in that case.
> 
> If you have an existing config, then buildroot will copy that
> to the linux directory, and neither menuconfig or xconfig
> will be launched.
> 
> It is launched if buildroot does not find a suitable config.
> 
> If you select to do make menuconfig, it will not launch  xconfig.
> 
> If you already have a .config, then you should do make linux-config
> or similar.

OK, I misunderstood that this only affects the case where you don't have
a .config.

I still think you might want to abort xconfig and not expect it to
launch menuconfig though.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
