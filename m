From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jul 2016 23:37:56 +0200
Subject: [Buildroot] [PATCH 00/12 v8] Introduce libudev (branch
	yem/libudev-4)
In-Reply-To: <20160718175241.GA3738@free.fr> (Yann E. MORIN's message of "Mon, 
 18 Jul 2016 19:52:41 +0200")
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <20160716154736.19dd42fb@free-electrons.com>
 <20160718175241.GA3738@free.fr>
Message-ID: <87twfawymj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi Yann,

 >> So I'm not sure if it's really worth the effort. After all, installing
 >> only libudev without eudev is not really supported upstream (we have to
 >> trick by building only some subdirectories).
 >> 
 >> I'm not entirely decided yet, so I'm waiting for arguments. But I'm
 >> hesitating between merging this, or asking people who really care about
 >> this to simply remove the eudev daemon in a post-build script.

 > But then you would not have libudev if you use mdev or a static /dev.

Is that a common use case? I wouldn't expect anybody to use static /dev
any more, and if you are using mdev then that is presumably for running
scripts on hotplug events? If so, why not just use the udev daemon for
this?

I do understand this could be useful for using libudev with devtmpfs
/dev, but wouldn't a simple post-build script to rm S10udev + udevd get
us 90% of the way without any extra complexity?

-- 
Venlig hilsen,
Peter Korsgaard 
