From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 14:38:37 +0200
Subject: [Buildroot] [PATCH 2/2] python-psutil: fix build against musl C
	library
In-Reply-To: <87shsu3i2z.fsf@dell.be.48ers.dk>
References: <20160920074127.22328-1-peter@korsgaard.com>
 <20160920074127.22328-2-peter@korsgaard.com>
 <20160920121433.3912ca4a@free-electrons.com>
 <8760pq50es.fsf@dell.be.48ers.dk>
 <20160920133053.3cb8e9bc@free-electrons.com>
 <87shsu3i2z.fsf@dell.be.48ers.dk>
Message-ID: <20160920143837.5bed86bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Rich from musl in Cc.

On Tue, 20 Sep 2016 13:51:16 +0200, Peter Korsgaard wrote:

>  > The answer of the musl developers would be: don't include
>  > <linux/ethtool.h> in the first place.  
> 
> I don't see the point of that reasoning - The whole idea of the Linux
> uapi headers is to provide headers for the kernel API.

Correct. I've already discussed this with the musl developers, and they
say that the "kernel headers are not clean to be used in userspace".

Of course, everyone else but the musl people are using the uapi headers
in userspace, but apparently, there are some things in there that do
not please the musl people.

Maybe Rich can explain more precisely the issue. So far I've only been
able to get "kernel headers are not clean enough", but not concrete
example of the problem.

> I'm not particulary interested in musl support for
> python-psutil. Alternatively we can just mark it as
> !BR2_TOOLCHAIN_USES_MUSL.
> 
> What do you suggest?

I don't care about python-psutil to be available with musl, so your
proposal is fine to me. Overall, I find the policy of musl developers
to be very annoying as:

 1/ It breaks many many many packages.

 2/ The only proposed solution is to duplicate code, which is not nice
    at all, and is difficult to get accepted by upstream project,
    living us with zillions of musl-related patches that we cannot
    upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
