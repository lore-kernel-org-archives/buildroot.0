From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 26 Jan 2009 13:08:52 +0100
Subject: [Buildroot] at91sam9260dfc_defconfig
In-Reply-To: <497DA5CA.4080409@free.fr>
References: <1232970924.2298.80.camel@elrond.atmel.com>
	<497DA5CA.4080409@free.fr>
Message-ID: <1232971732.2298.84.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-26 klockan 13:00 +0100 skrev Cyril HAENEL:
> 
> 
> Ulf Samuelsson a ?crit : 
> > It builds for me
> > 
> > There were three failures during my last build.
> > rubix did not compile.
> > 	This is a game, and I do not know why it was enabled
> > 	The failure was screen related, and the 
> > 	sam9260 does not have an LCD controller 
> > 	so I simply removed the package.
> > 
> > libdnet failed, removed from .config
> > 
> > mpg123 failed, a patch for this is now in buildroot
> > 
> > After that I have
> > * at91bootstrap-2.10
> > * u-boot-2009.01
> > * au-boot autoscripts
> > * ext2 file system
> > * jffs2 filesystem
> > * linux kernel
> > 
> > ----
> > A general note on ARM release chain
> > ?I have seen many packages that fail for ARM due to use 
> > of "__clz_tab" which is a hidden symbol in libc
> > This seems to be a tool bug.
> > 
> > 
> > BR
> > Ulf Samuelsson
> >   
> > 
> > 
> > ____________________________________________________________________
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> It's incredible :
> 
> What BR version do you use, the last release candidate or the svn
> version ?
> 
I only work with the svn.
As I pointed out before, there are way too many packets
which has inherent problems.

I think we should solve these problems first
and then think about a release.

php does NOT build until 1-2 days ago.

build a vanilla defconfig from svn
and then copy my buildall.sh script to topdir
and then do

./buildall.sh buildall

and you see what builds and what does not.


> What are exactly the command you type  !?
> 
> Can you try to activate the jffs2 as target filesystem, with Nand
> flash 2KB page and 128KB block ?
> Can you try to activate Bash, Boa, PHP and Sqlite ?
> 
I do not think I try any of these except php
which was broken, and I expect still is broken in -rc2

BR
Ulf Samuelsson

> Regards,
> Cyril HAENEL
> -- 
> 
> Cyril Haenel
> Registered Linux User #332632
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
