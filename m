From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Feb 2014 21:50:54 +0100
Subject: [Buildroot] [PATCH] linux: don't automatically set
	uevent_helper with mdev /dev management
In-Reply-To: <769563a34e142e85ec4c.1391761259@argentina> (Thomas De
 Schampheleire's message of "Fri, 07 Feb 2014 09:20:59 +0100")
References: <769563a34e142e85ec4c.1391761259@argentina>
Message-ID: <87wqh6640h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > When mdev /dev management is chosen in the buildroot configuration, the
 > Linux configuration is updated automatically to set option
 > CONFIG_UEVENT_HELPER_PATH to "/sbin/mdev". However, the help text of this
 > option explicitly recommends not setting this option due to large
 > performance impact during boot (experienced first hand by the reporter ?nd
 > author).

 > The mdev startup script S10mdev already sets the helper during userspace
 > boot, which will make sure mdev is working correctly.

 > Fixes bug #6596: https://bugs.busybox.net/show_bug.cgi?id=6596

 > Reported-by: Andreas Koop <andreas.koop@zf.com>
 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Hmm, but the the coldplug handling with 'mdev -s' afaik doesn't handle
module or firmware loading, so those features will break from this.

I would be interested in knowing why hotplug is so much slower than
coldplug. Do you have any idea about how many times mdev gets executed
during bootup?

-- 
Bye, Peter Korsgaard
