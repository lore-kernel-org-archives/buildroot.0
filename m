From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Wed, 03 Feb 2010 02:49:37 +1100
Subject: [Buildroot] 'make ARCH=arm' warning, how can I correct?
In-Reply-To: <SNT129-W10DB011B5927021C8C0055B9570@phx.gbl>
References: <SNT129-W159AEF2E2D689BDC2F9C82B9570@phx.gbl>
	, <5f2b61002020620r5fcd9847ke8b12c873374cc83@mail.gmail.com>
	<SNT129-W10DB011B5927021C8C0055B9570@phx.gbl>
Message-ID: <1265125777.2553.2.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Tue, 2010-02-02 at 16:01 +0100, Tony Mozi wrote:
> Hi,
> Thank you for your answer Bj?rn Forsman.
> 
> I have already make 'make menuconig', I modified
>         Target Architecture (arm) --->
>         Target Architecture Variant (arm922t) --->
>         Target ABI (0ABI) --->
> Then I make a 'make'.
> 
> I added the PATH with the correct link and export
> CROSS_COMPILE="arm-linux-uclibc-"
> Well, I supposed that I can make 'make ARCH=arm'.
> But I have these warnings and I don't know if they are important or
> not.
> 
> When I start the SDK, I have 'Welcome to Buildroot buildroot login:' I
> have not this pass. 
> I want to remove it, but I don't know where?
> 
> BR
> 
> > Date: Tue, 2 Feb 2010 15:20:47 +0100
> > Subject: Re: [Buildroot] 'make ARCH=arm' warning, how can I correct?
> > From: bjorn.forsman at gmail.com
> > To: spooflinux at hotmail.fr
> > CC: buildroot at busybox.net
> > 
> > Hi Tony,
> > 
> > On 2 February 2010 14:47, Tony Mozi <spooflinux@hotmail.fr> wrote:
> > > Hello all,
> > > I make the cross-compilation for an ARM.
> > >
> > > When I make 'make ARCH=arm', I have some errors :
> > >
> > > <stdin>:91:1: warning: "__IGNORE_sync_file_range" redefined
> > > In file included from <stdin>:2:
> > > include/arm/unistd.h:444:1: warning: this is the location of the
> previous
> > > definition
> > > <stdin>:1097:2: warning: #warning syscall fadvise64 not
> implemented
> > > <stdin>:1265:2: warning: #warning syscall migrate_pages not
> implemented
> > > <stdin>:1321:2: warning: #warning syscall pselect6 not implemented
> > > <stdin>:1325:2: warning: #warning syscall ppoll not implemented
> > > <stdin>:1365:2: warning: #warning syscall epoll_pwait not
> implemented
> > >
> > > How can I correct?
> > 
> > Do not use 'make ARCH=arm' with Buildroot. Use 'make menuconfig' and
> select
> > the target architecture in the menu. See 'make help' for some
> predefined
> > configurations.
> > 
> > Best regards,
> > Bj?rn Forsman
> 
> 
> ______________________________________________________________________
> Faites une bonne action avec Bing Solidaire ! C'est ici !
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



> When I start the SDK, I have 'Welcome to Buildroot buildroot login:' I
> have not this pass. 
> I want to remove it, but I don't know where?

Simply modify the file /etc/issue to your taste.
This text file holds the greeting.
I wouldn't worry too much about the compile warnings, they are normal.

HTH

-- 
Best regards,
Kris
