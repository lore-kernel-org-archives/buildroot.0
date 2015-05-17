From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 May 2015 15:55:22 +0200
Subject: [Buildroot] [PATCH v3] dieharder: new package
In-Reply-To: <20150517121815.GA29019@vdg.name>
References: <1431848603-30142-1-git-send-email-julien.viarddegalbert@openwide.fr>
 <20150517102036.464066b9@free-electrons.com>
 <20150517121815.GA29019@vdg.name>
Message-ID: <20150517155522.7b71a525@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Viard de Galbert,

On Sun, 17 May 2015 14:18:15 +0200, Julien Viard de Galbert wrote:

> > Those help lines look fairly too long. Make sure they're not longer
> > than 72 columns.
> > 
> Ok, also I just sent another patch to document that point.

Sure, good idea.

> You are right this should be made more explicit, there is an
> extra "beverage" clause in the licence file.
> I could either use the syntax the software uses:
> DIEHARDER_LICENSE = GPLv2b (b for beverage)
> 
> Or make it simply:
> DIEHARDER_LICENSE = GPLv2 with beverage clause
> 
> What do you think ?

The second solution you propose looks better to me.

> > > +DIEHARDER_LICENSE_FILES = $(DIEHARDER_SUBDIR)/COPYING
> > > +DIEHARDER_DEPENDENCIES = gsl
> > > +
> > > +DIEHARDER_CONF_OPTS = --includedir=$(STAGING_DIR)/usr/include
> > 
> > Why do you need this? This looks wrong, as it would install the
> > headers in a completely wrong location, if dieharder would be
> > installing headers. --includedir is not used to specify where a program
> > should look for headers of libraries, but to tell where it should
> > install its own headers.
> > 
> That was to try to fix the build using "/usr/include/" but it's wrong.
> I overlooked the normal --includedir function. So I guess the upstream
> scripts are wrong as they use the --includedir value to also specify
> some include search path...
> 
> Also it _really_ do install some headers there. We probably don't want
> those on the target rootfs. So I guess I need to find how to tell it not
> to do that...

As long as headers are installed in $(TARGET_DIR)/usr/include, you
shouldn't do anything: Buildroot automatically deletes this directory
at the end of the build process.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
