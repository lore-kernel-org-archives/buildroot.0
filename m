From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 22 Oct 2020 23:21:54 +0200
Subject: [Buildroot] Minnowboard set up problem
In-Reply-To: <CALbLrU3i4W9=EhobCX5+g_1ZCKQCzYFPzatz+E-MwxU9OX8tkg@mail.gmail.com>
References: <CALbLrU2J46KsUr8b+8U=0M24En3B+w9rwn3YJ6ve=COdZ7RATw@mail.gmail.com>
 <20201022215343.7acadee4@gmx.net>
 <CALbLrU3i4W9=EhobCX5+g_1ZCKQCzYFPzatz+E-MwxU9OX8tkg@mail.gmail.com>
Message-ID: <20201022232154.7a2adbaa@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Facu,

please keep buildroot at busybox.net in CC...

On Thu, 22 Oct 2020 17:38:45 -0300, Facu Ramallo <facku24@gmail.com> wrote:

> Hi Peter!
> 
> Thanks for the response.
> 
> I'm not quite sure about a problem with sshd daemon, because my connection
> is established by a *ttyS0*.

Which comes after /etc/init.d/S50sshd (see target/etc/inittab and
target/etc/init.d/rcS)...

> 
> Starting syslogd: OK
> Starting klogd: OK
> Running sysctl: OK
> Saving random seed: random: dd: uninitialized urandom read (512 bytes read)
> OK
> Starting network: Generic PHY r8169-200:00: attached PHY driver [Generic
> PHY] (mii_bus:phy_addr=r8169-200:00, irq=IGNORE)
> IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> udhcpc: started, v1.32.0
> random: mktemp: uninitialized urandom read (6 bytes read)
> [drm] Cannot find any crtc or sizes
> udhcpc: sending discover
> [drm] Cannot find any crtc or sizes
> udhcpc: sending discover
> udhcpc: sending discover
> udhcpc: no lease, failing
> FAIL
> 
> After reaching this point, nothing else happens and I'm not able to see if
> ssh was correctly deployed in /bin.

Take a look at the start scripts at /etc/init.d/ (or target/etc/init.d/ in your
build directory)...., see what comes after S40network..., try to add some
more debug output/printf (still suspecting S50sshd)...

Regards,
Peter

> 
> I waited for 6 minutes, and still stuck there.
> 
> With a clean version of my buildroot, with just only *make
> minnowboard_max_defconfig; make*, I'm able to login:
> 
> Saving random seed: random: dd: uninitialized urandom read (512 bytes read)
> OK
> Starting network: Generic PHY r8169-200:00: attached PHY driver [Generic
> PHY] (mii_bus:phy_addr=r8169-200:00, irq=IGNORE)
> IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> udhcpc: started, v1.32.0
> random: mktemp: uninitialized urandom read (6 bytes read)
> [drm] Cannot find any crtc or sizes
> udhcpc: sending discover
> [drm] Cannot find any crtc or sizes
> udhcpc: sending discover
> udhcpc: sending discover
> udhcpc: no lease, failing
> FAIL
> 
> 
> *Welcome to Buildrootbuildroot login: *
> 
> Do you know where I can take a peak?
> 
> Regards!
> 
> El jue., 22 de oct. de 2020 a la(s) 16:53, Peter Seiderer (ps.report at gmx.net)
> escribi?:
> 
> > Hello Facu Ramallo,
> >
> > On Thu, 22 Oct 2020 15:53:00 -0300, Facu Ramallo <facku24@gmail.com>
> > wrote:
> >  
> > > Hi guys!
> > >
> > > I'm brandly new with buildroot. I'm trying to build a system for my
> > > minnowboard. After a little research, I found out that the basic steps to
> > > start are:
> > >
> > >    - *make minnowboard_max_defconfig*
> > >    - *make*
> > >    - *dd if=sdcard.img of=my_sdcard bs=1M*
> > >
> > > And I could finally start my linux distribution on my minnowboard. But,
> > > then I used
> > >
> > >    - *make menuconfig*
> > >
> > > In order to enable the packages for openssh, I want to send some code
> > > through  scp. But, after enable those packages, run
> > >
> > >    - *make*
> > >    - *dd if=sdcard.img of=my_sdcard bs=1M*
> > >
> > > And the problem is that after my system boots, I don't read the
> > > messages "*Wellcome
> > > to Buildroot*" and "*buildroot login:*" anymore.
> > >
> > > Can you tell me please, if I did something wrong?  
> >
> > Would suspect a long startup time of the sshd daemon because of lack
> > of enough random data (search for 'ssh random booting' for details)...
> >
> > Try to wait longer...
> >
> > Regards,
> > Peter
> >  
> > >
> > > Regards!  
> >
> >  
