From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Sep 2008 08:57:27 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <20080910013227.GA12253@cloud.net.au> (Hamish Moffatt's message
	of "Wed\, 10 Sep 2008 11\:32\:27 +1000")
References: <20080909085015.CBF7C3C608@busybox.net>
	<20080910013227.GA12253@cloud.net.au>
Message-ID: <871vzsh4iw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 Hamish> Actually that was deliberate. I noticed that after I changed
 Hamish> package/busybox/Config.in, I still had

 Hamish> BR2_BUSYBOX_VERSION_1_11_X=y
 Hamish> BR2_BUSYBOX_VERSION="1.11.1"

 Hamish> until next time I ran a menuconfig/oldconfig/etc. If the patches are
 Hamish> removed immediately upon version bump but you don't update your config,
 Hamish> you'll be building without those patches. :(

 Hamish> I wonder if BR2_BUSYBOX_VERSION should be determined by the Makefiles
 Hamish> rather than through the config system, so that this can't happen?

Notice that this isn't a busybox specific issue - It's everywhere we
have a version selection. Maybe it could be done in the makefile, but
I do find it quite handy to have it all in the Config.in.

Maybe the solution is simply to teach people to run make oldconfig
whenever they rebase?

-- 
Bye, Peter Korsgaard
