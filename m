From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 25 Jun 2007 15:08:28 +0200
Subject: [Buildroot] Can "make <>_defconfig" rules be restored?
In-Reply-To: <003801c7b605$0e32cb10$6604a8c0@shukson>
References: <01c301c7b519$52679b40$6e02a8c0@k2>
	<20070623093927.GG4096@aon.at> <003801c7b605$0e32cb10$6604a8c0@shukson>
Message-ID: <1182776909.20950.4.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> >>
> >>I would like to use "_defconfig" files to save and restore specific 
> >>defaults
> >>for several platforms.
> >>
> >>The Makefile at one point supported loading of user defined "_defconfig"
> >>files. In the current Makefile the noconfig_targets part of "_defconfig" 
> >>is
> >>commented out.
> >>
> >
> > Yes, the problem with this kind of _defconfig was that in a tree that
> > had already one or two compiled arches lying around, the find was the
> > cause for a delay in the order of several minutes on my box.
> The purpose of this patch is to have several arches lying around.
> 
> 
> 
It is not particularily efficient to search the whole tree for config files.

In my private implementation, I only use the "configs" directory for
storage of such files.
make B=<board> board
will copy the latest version (they are stored as <board>-<date>.config)
to .config.
The implementation is simplistic.
Copy ALL the files to .confiug, so the latest file will overwrite all other files.



- 
Best Regards,
Ulf Samuelsson
