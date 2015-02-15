From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Feb 2015 21:12:34 +0100
Subject: [Buildroot] [PATCH v4] Allow a single DHCP configuration via
	the system configuration submenu
In-Reply-To: <54DF7567.7090308@ou.edu> (Steve Kenton's message of "Sat, 14 Feb
 2015 10:18:47 -0600")
References: <98184085.31058823.1422895105455.JavaMail.root@openwide.fr>
 <54DF7567.7090308@ou.edu>
Message-ID: <87y4nzx7bh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Kenton <skenton@ou.edu> writes:

 >>> 
 >>>> +config BR2_SIMPLE_DHCP
 >>> 
 >>> We're not completely consist with this, but the new system options
 >>> are
 >>> called BR2_SYSTEM_*, so I've renamed to the option.
 >>> 
 > On this topic, what about the following idea?

 > If the interface name is blank do not perform DHCP as currently
 > If the interface name is "*" then run something like this script
 > to automatically find and use the first network interface for DHCP
 > I'd like to be able to use the same BR config on slightly different
 > boards that may sometimes have different network interface names/orders
 > The kernel handles that OK with modules so maybe buildroot could to?

So those boards have network interfaces not using eth%d names? That
sounds pretty uncommon to me. Another approach would simply be add an
init script to rename those to eth0 with nameif.

-- 
Bye, Peter Korsgaard
