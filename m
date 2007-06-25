From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 25 Jun 2007 16:02:31 +0200
Subject: [Buildroot] Can "make <>_defconfig" rules be restored?
In-Reply-To: <1182777605.10703.37.camel@localhost.localdomain>
References: <01c301c7b519$52679b40$6e02a8c0@k2>
	<20070623093927.GG4096@aon.at> <003801c7b605$0e32cb10$6604a8c0@shukson>
	<1182776909.20950.4.camel@aeglos.sweden.atmel.com>
	<1182777605.10703.37.camel@localhost.localdomain>
Message-ID: <1182780151.22583.4.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> It is not particularily efficient to search the whole tree for config files.
> 
> The target/ directory is not that big on my snapshot (although 1 month
> old):
> 

The original version searched for ".", I.E: the complete tree,
and this was what my reply referred to.

> : hcegtvedt at hcegtvedt ~/gitwork/buildroot > find target | wc -l
> 554
> : hcegtvedt at hcegtvedt ~/gitwork/buildroot > du -sh target 
> 6,3M    target
> 
> 
> > In my private implementation, I only use the "configs" directory for
> > storage of such files.
> Where is the configs directory, under target/configs/ ?
> 

On top top level <buildroot>/configs

> > make B=<board> board
> 
> Much like the
> make <board>_defconfig
> make
> 
> procedure would do.
> 

How will you handle several version of the same configuration?

I would like to keep packages/target clean, so they are not updated by
the user.
The user should be able to easily generate a new configuration


> > will copy the latest version (they are stored as <board>-<date>.config)
> > to .config.
> 
> I.e. the save_config makefile target you talked about?
> 
> > The implementation is simplistic.
> > Copy ALL the files to .confiug, so the latest file will overwrite all other files.
> 
-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457
