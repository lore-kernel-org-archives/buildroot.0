From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2015 09:11:52 +0100
Subject: [Buildroot] [PATCH] core: fix setting of HOSTARCH
In-Reply-To: <20151111235359.707acc35@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 11 Nov 2015 23:53:59 +0100")
References: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
 <20151111235359.707acc35@free-electrons.com>
Message-ID: <87si4bocvr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Those build failures are not caused by a 32 bits vs. 64 bits issue. In
 > fact, I started running my chroot under "linux32", but it was even
 > worse. Because indeed my chroots *are* 64 bits.

 > However, the real problem is that the new Linaro toolchains have been
 > built against glibc 2.14 (for the host), while my chroot only uses
 > glibc 2.11 (from Debian 6.0).

Ahh. Debian 6.0 is getting quite old (2011), but yeah - People on
Enterprise distributions might end up with the same problems.

 > I'm not sure how to handle this. Some old distros may not have glibc
 > 2.14.

I don't think there's much we can do, besides perhaps adding a comment
in the help text.

I'm not sure how realistic it is to convince the Linaro people to build
their toolchains on ancient distributions.


 > In any case, I believe the rework of how we get HOSTARCH is not really
 > needed IMO: 1/ it is not the source of the problem for the Linaro
 > toolchain and 2/ it is most likely appropriate to use setarch/linux32
 > when running a 32 bits chroot under a 64 bits kernel.

I agree about linux32, yes.

-- 
Venlig hilsen,
Peter Korsgaard 
