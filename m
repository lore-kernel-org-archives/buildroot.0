From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2011 17:34:38 +0200
Subject: [Buildroot] [PATCH] Fix sorting-related issue when using make
 3.82
In-Reply-To: <b48283f33363fb03ff99.1312556072@localhost6.localdomain6>
References: <b48283f33363fb03ff99.1312556072@localhost6.localdomain6>
Message-ID: <20110805173438.4bc1285f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

The commit log should be wrapped to ~80 columns.

Le Fri, 05 Aug 2011 16:54:32 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> In make 3.82, wildcards are no longer sorted. This impacts lines like:
> 	include package/*/*.mk
> 
> A specific scenario under which this fails: if the .mk file of an autotools-based package with FOO_AUTORECONF set to yes, happens to be included before the autoconf/autoconf.mk file, the $(AUTORECONF) variable is not yet set and autoreconfiguration fails with the following message:

I don't think it is the right fix, because there shouldn't be
things that depend on the order of inclusion of the various packages.

> caused by the following statement in package/Makefile.autotools.in:
> 	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)

Can you try to use $$(AUTORECONF) instead of $(AUTORECONF) ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
