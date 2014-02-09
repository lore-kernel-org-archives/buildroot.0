From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Feb 2014 22:52:30 +0100
Subject: [Buildroot] [PATCH] linux: don't automatically set
	uevent_helper with mdev /dev management
In-Reply-To: <CAAXf6LU1YT7Ypua=Frs0gSikDLJ_E-sWaKPn4BMY0Mz2sUHOWg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Sat, 8 Feb 2014 22:06:50
 +0100")
References: <769563a34e142e85ec4c.1391761259@argentina>
 <87wqh6640h.fsf@dell.be.48ers.dk>
 <CAAXf6LV=o61iJVycRW-+4boS08=Ar39-uxgUqj6XoqcbzSHmrA@mail.gmail.com>
 <87ob2i63cg.fsf@dell.be.48ers.dk>
 <CAAXf6LWNtuuivOXDhqMbK+3kh6t1vBHCOmU1D-9+PJqi_wjLjw@mail.gmail.com>
 <87k3d55nw8.fsf@dell.be.48ers.dk>
 <CAAXf6LU1YT7Ypua=Frs0gSikDLJ_E-sWaKPn4BMY0Mz2sUHOWg@mail.gmail.com>
Message-ID: <87mwi00x9d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > Thanks for the clarifications and test.
 > An alternative is to provide an option in buildroot to select the
 > behavior: either the current behavior (install mdev as hotplug helper
 > by setting the kernel config) or the proposed behavior in this patch
 > by removing that.
 > Then every project can make its own tradeoff...

 > What do you think of that?

I don't like it. We had several people report the issue, so I think the
best way forward is to apply your patch. If people want the extra
features of mdev-from-bootup they can always tweak their kernel config
to set it.

-- 
Bye, Peter Korsgaard
