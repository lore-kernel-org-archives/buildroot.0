From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Oct 2011 08:54:18 +0200
Subject: [Buildroot] [git commit] crosstool-ng: fix ccache dependencies
	order
In-Reply-To: <20111029082300.5c4086df@skate> (Thomas Petazzoni's message of
 "Sat, 29 Oct 2011 08:23:00 +0200")
References: <20111028124451.0B18C8F35A@busybox.osuosl.org>
 <20111029082300.5c4086df@skate>
Message-ID: <87zkgknv8l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Fri, 28 Oct 2011 14:41:26 +0200,
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

 >> avoid gawk complaining

 Thomas> about what ?

Not finding host-ccache as it isn't built yet.

 >> when running 'make ctng-menuconfig' in a
 >> clean/distclean tree in which ccache and crosstool-ng are enabled

 Thomas> This sounds like a workaround. The ordering of dependencies inside a
 Thomas> _DEPENDENCIES variable shouldn't matter. Isn't it a missing dependency
 Thomas> somewhere else ?

Well, yes - but host-ccache is special as it needs to be built before
anything else. I don't think it makes sense to add a bunch of

ifeq ($(BR2_CCACHE),y)
FOO_DEPENDENCIES += host-ccache
endif

to the packages.

-- 
Bye, Peter Korsgaard
