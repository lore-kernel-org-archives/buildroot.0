From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Sep 2020 16:59:09 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/boost: bump to version 1.74.0
In-Reply-To: <199e6a77-7ebc-eb1c-4482-206f1429c5d0@green-communications.fr>
References: <20200909093240.2178664-1-fido_max@inbox.ru>
 <20200909155600.6cf8450e@windsurf.hq.k.grp>
 <199e6a77-7ebc-eb1c-4482-206f1429c5d0@green-communications.fr>
Message-ID: <20200909165909.550d0175@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Wed, 9 Sep 2020 16:27:14 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> > We don't have any failures of boost 1.73.0 with gcc 10 in our
> > autobuilders. Could you give more details about a specific
> > configuration that fails to build?  
> 
> boost::bimap is a header-only library, it cannot fail to build, only its
> reverse dependencies may fail. the release notes? also mention other
> header-only boost libraries "and more" are affected by the non-standard
> std::allocator usage.
> 
> C++20 isn't the default in GCC 10 and it's highly probable that there
> are no package in buildroot that requires both boost and C++20.
> Especially since C++20 was finally approved this very Saturday.
> 
> This is more about future proofing than fixing existing bugs.
> 
> [0] https://www.boost.org/users/history/version_1_74_0.html

Thanks a lot for this explanation, it now makes complete sense. I think
we should include exactly what you have described here in the commit
log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
