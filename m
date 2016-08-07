From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 22:32:51 +0200
Subject: [Buildroot] cmake Release build overwrites Os
In-Reply-To: <20160807164032.GL22524@waldemar-brodkorb.de>
References: <20160807164032.GL22524@waldemar-brodkorb.de>
Message-ID: <20160807223251.1177a2c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Aug 2016 18:40:32 +0200, Waldemar Brodkorb wrote:

> while doing the m68k patch for assimp, I realized that following is
> used to configure cmake based packages:
> package/pkg-cmake.mk:           -DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release)
> 
> This means that Cmake adds -O3 to the CFLAGS/CXXFLAGS _after_ -Os
> and so get used.
> 
> Is this the correct behaviour or do I missed something?

There are unfortunately lots and lots of packages whose build system
enforce some -O<xyz> option, regardless of what Buildroot defines. I'm
not sure how hard we want to work against those packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
