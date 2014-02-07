From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Feb 2014 22:05:19 +0100
Subject: [Buildroot] [PATCH] linux: don't automatically set
	uevent_helper with mdev /dev management
In-Reply-To: <CAAXf6LV=o61iJVycRW-+4boS08=Ar39-uxgUqj6XoqcbzSHmrA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Fri, 7 Feb 2014 22:00:48
 +0100")
References: <769563a34e142e85ec4c.1391761259@argentina>
 <87wqh6640h.fsf@dell.be.48ers.dk>
 <CAAXf6LV=o61iJVycRW-+4boS08=Ar39-uxgUqj6XoqcbzSHmrA@mail.gmail.com>
Message-ID: <87ob2i63cg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> Hmm, but the the coldplug handling with 'mdev -s' afaik doesn't handle
 >> module or firmware loading, so those features will break from this.

 > Isn't this handled by the installation of the hotplug helper from
 > S10mdev, after which mdev -s is run?

Yes, if the events happen after that line, but not if they happen
before.

 > I.e. everything that happened before S10mdev is caught by 'mdev -s'
 > and everything after is handled by the hotplug helper, right?

No, mdev -s only scans /sys for devices and create the corresponding
device nodes (already done by devtmpfs) and execute whatever commands
you have defined, it afaik doesn't handle module load or firmware requests.


 >> I would be interested in knowing why hotplug is so much slower than
 >> coldplug. Do you have any idea about how many times mdev gets executed
 >> during bootup?
 >> 

 > No, I don't know. I do know that on one particular arm-based single
 > core system, the time to enter userspace increased from 2 seconds to
 > 10 seconds due to this hotplug helper.

Funky. I personally have never used mdev, but that sounds pretty
extreme.


-- 
Bye, Peter Korsgaard
