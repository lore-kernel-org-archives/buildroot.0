From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 23 Sep 2007 16:23:36 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20070923111910.GE20058@aon.at>
References: <20070923105715.49DFF30087@busybox.net>
	<20070923111910.GE20058@aon.at>
Message-ID: <1190557416.7015.10.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2007-09-23 klockan 13:19 +0200 skrev Bernhard Fischer:
> On Sun, Sep 23, 2007 at 03:57:15AM -0700, ulf at uclibc.org wrote:
> >Author: ulf
> >Date: 2007-09-23 03:57:15 -0700 (Sun, 23 Sep 2007)
> >New Revision: 19964
> >
> >Log:
> >fix error when doing 'make %_defconfig
> >
> >Modified:
> >   trunk/buildroot/Makefile
> >
> >
> >Changeset:
> >Modified: trunk/buildroot/Makefile
> >===================================================================
> >--- trunk/buildroot/Makefile	2007-09-23 10:56:16 UTC (rev 19963)
> >+++ trunk/buildroot/Makefile	2007-09-23 10:57:15 UTC (rev 19964)
> >@@ -409,7 +409,7 @@
> > 
> > %_defconfig: $(CONFIG)/conf
> > 	cp $(shell find ./target/ -name $@) .config
> >-	@$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
> >+	- $(MAKE) oldconfig
> 
> 1) whitespace damaged
> 2) erroneously removes '@'
OK, I'll fix both.

> 3) what error were you seeing?
Don't remember exactly,
Reported this two weeks ago. 
This was fixed by Hans Christian in his trunk.

It looks like conf does not complete.
The fix handles that, and the error message is gone.

> 
> > 
> > help:
> > 	@echo 'Cleaning:'
> 
> Please document the config copying in the help or remove it (I supposed
> folks should be able to call 'cp' themself).
> Oh and why do those live in project/* and not near the other
> config-related targets?
> 
