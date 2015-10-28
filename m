From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2015 22:51:21 +0100
Subject: [Buildroot] [PATCH 2/3] skeleton: optionally wait for network
	interfaces to appear
In-Reply-To: <20151028213702.GB3650@free.fr> (Yann E. MORIN's message of "Wed, 
 28 Oct 2015 22:37:02 +0100")
References: <1446047943-24641-1-git-send-email-jezz@sysmic.org>
 <1446047943-24641-3-git-send-email-jezz@sysmic.org>
 <20151028174653.GA3650@free.fr> <2419445.kGEUX5UIA3@sagittea>
 <20151028213702.GB3650@free.fr>
Message-ID: <87mvv27jc6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Also, I read this in man 5 interfaces;

 >     When ifupdown is being called with the --all option, before doing
 >     anything to interfaces, if [sic] calls all the hook scripts (pre-up
 >     or down) with IFACE set to "--all", LOGICAL set to the current value
 >     of --allow parameter (or "auto" if it's  not set), ADDRFAM="meta"
 >     and METHOD="none". After all the interfaces have been brought up or
 >     taken down, the appropriate scripts (up or post-down) are executed.

 > Since S40network calls 'ifup -a' and you added a pre-up script, I guess
 > it should filter out the '--all' interface and exit early in that case.

As far as I can see from the busybox implementation atleast, -a (all)
only causes it to run ifup/ifdown (with IFACE set to the interface name) for
each interface listed as auto, so it doesn't do the "--all" thing, but
the Debian variant does.

-- 
Venlig hilsen,
Peter Korsgaard 
