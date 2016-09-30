From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2016 10:10:34 +0200
Subject: [Buildroot] [PATCH] package/opencv3: fix CMAKE_CXX_FLAGS
In-Reply-To: <CAMo8BfKyMkgwNih1MSGh+qrKtRMob4_j8neOi3v4e5xEaJKnBg@mail.gmail.com>
References: <1475088032-30321-1-git-send-email-jcmvbkbc@gmail.com>
 <20160929112736.27dc4474@free-electrons.com>
 <CAMo8BfKyMkgwNih1MSGh+qrKtRMob4_j8neOi3v4e5xEaJKnBg@mail.gmail.com>
Message-ID: <20160930101034.4adf4d7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Sep 2016 09:14:41 -0700, Max Filippov wrote:

> > There is something fishy going on here. Indeed,
> > support/misc/toolchainfile.cmake.in contains:
> >
> >   set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
> >
> > So it should normally always prefix CMAKE_CXX_FLAGS with
> > TARGET_CXXFLAGS. Can you check the toolchain.cmake file that gets
> > generated during your build? Does it contains the Xtensa specific
> > CXXFLAGS ?  
> 
> Yes, it does.

So if it does, why is your patch necessary? I'm not following here.

Do you mean that the Xtensa-specific flags are present in the
toolchain.cmake file, but are in the end not used during the build ?

> opencv2 which has similar cmake build system but doesn't pass
> -DCMAKE_CXX_FLAGS builds correctly.

OK.

Samuel, can you advise here?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
