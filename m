From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 17 Jul 2015 16:13:21 +0200
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-07-14
In-Reply-To: <1436982736.3682.16.camel@synopsys.com>
References: <20150715063016.118A21016B5@stock.ovh.net>
 <1436982736.3682.16.camel@synopsys.com>
Message-ID: <1437142401.1824.6.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey, Thomas,

On Mi, 2015-07-15 at 17:52 +0000, Alexey Brodkin wrote:
> Hi Thomas,
> 
> On Wed, 2015-07-15 at 08:30 +0200, Thomas Petazzoni wrote:
> > Those results are limited to the arc architecture.
> > 
> > Build statistics for 2015-07-14
> > ===============================
> > 
> >         success : 6  
> >        failures : 23 
> >        timeouts : 0  
> >           TOTAL : 29 
> > 
> > Classification of failures by reason
> > ====================================
> > 
> >                   zeromq-4.0.5 | 9 
> >              util-linux-2.26.2 | 5 
> >                   boost-1.58.0 | 3 
> >                alsa-lib-1.0.29 | 3 
> >              btrfs-progs-4.1.1 | 1 
> >              libselinux-2.1.13 | 1 
> >                    tinc-1.0.24 | 1 
> > 
> > Detail of failures
> > ===================
> > 
> >          arc |                   boost-1.58.0 | NOK | 
> > http://autobuild.buildroot.net/results/596c2eb1378946b8c0fea6b3ebcf
> > 80ee7e14995a/
> >          arc |                   boost-1.58.0 | NOK | 
> > http://autobuild.buildroot.net/results/0585f6c926042d7c859150dbf7b3
> > 3928c4687273/
> >          arc |                   boost-1.58.0 | NOK | 
> > http://autobuild.buildroot.net/results/16fd658176b4e4927f7c7dbe5598
> > b7a38b819af9/
> 
> Looks like an issue with boost that for some reason
> uses syscall (non-existent on some arches including ARC)
> directly instead of libc's eventfd().
> ----------------->8-------------------
> "syscall(__NR_eventfd, 0);"
> ----------------->8-------------------

__NR_eventfd needs __ARCH_WANT_SYSCALL_NO_FLAGS to be defined in
asm/unistd.h. I am not a toolchain expert so I do not know how to
handle this.

Best regards
J?rg Krause
