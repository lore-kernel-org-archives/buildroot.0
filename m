From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 09:30:30 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <87zj0oznp2.fsf@dell.be.48ers.dk>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
 <87zj0oznp2.fsf@dell.be.48ers.dk>
Message-ID: <20150915093030.622d2366@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Sep 2015 23:38:17 +0200, Peter Korsgaard wrote:

>  > Then we can safely start mdev before the syslog/klogd stuff, right?
> 
> Yes, but I still question the need for all of this work in the first
> place.

On my side, I don't. Some people are still forced to use 2.6.x kernels
older than 2.6.32, and if Luca (who is a knowledgeable and
skilled developer) has such a need, I'm sure it means there is a silent
group of people stuck with prehistoric kernels that would benefit from
this.

In addition, the changes that Luca is proposing are very
self-contained, and often shared with the other /dev management
solutions. So I don't see a lot of additional complexity in what Luca
is proposing.

> Is there any reason for NOT using devtmpfs if it is available?

Well the point is precisely that it isn't.

> And if it isn't, is making Buildroot more complicated better than
> asking people to backport devtmpfs support and/or upgrade to a newer
> kernel?

Luca is using a vendor-specific kernel in which the entire SoC support
is not in mainline. So moving to a newer kernel is simply not an option
(or an option with a several man-years effort, which for many companies
is the same as "not an option").

I'm not sure how complicated it is to backport devtmpfs. However I
would suspect that it isn't that easy.

> We certainly don't test such old kernel headers in the autobuilders.

Indeed, we don't. But we could ask Luca, as part of this patch series,
to help us add such a toolchain in our autobuilders. So far, Luca has
provided some patches that are perfectly documented, along with test
cases and test scripts to validate the booting with all possible /dev
management situations. To me, the perfectness of Luca's contribution is
a good enough argument to merge this feature :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
