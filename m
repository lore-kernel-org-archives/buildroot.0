From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Nov 2015 09:28:20 +0100
Subject: [Buildroot] [PATCH] core: fix setting of HOSTARCH
In-Reply-To: <87si4bocvr.fsf@dell.be.48ers.dk>
References: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
 <20151111235359.707acc35@free-electrons.com>
 <87si4bocvr.fsf@dell.be.48ers.dk>
Message-ID: <20151112092820.4500de49@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Nov 2015 09:11:52 +0100, Peter Korsgaard wrote:

>  > Those build failures are not caused by a 32 bits vs. 64 bits issue. In
>  > fact, I started running my chroot under "linux32", but it was even
>  > worse. Because indeed my chroots *are* 64 bits.
> 
>  > However, the real problem is that the new Linaro toolchains have been
>  > built against glibc 2.14 (for the host), while my chroot only uses
>  > glibc 2.11 (from Debian 6.0).
> 
> Ahh. Debian 6.0 is getting quite old (2011), but yeah - People on
> Enterprise distributions might end up with the same problems.

Indeed, and that's why I'd like to keep my old distro.

>  > I'm not sure how to handle this. Some old distros may not have glibc
>  > 2.14.
> 
> I don't think there's much we can do, besides perhaps adding a comment
> in the help text.
> 
> I'm not sure how realistic it is to convince the Linaro people to build
> their toolchains on ancient distributions.

So I guess that the only reasonable option here is that I had some
logic in autobuild-run to not use this toolchain when the host C
library is too old. This way, we keep using the Linaro toolchain on
build slaves that are modern enough, and we don't have build failures
on the others.

Thoughts?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
