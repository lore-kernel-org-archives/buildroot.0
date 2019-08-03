From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 19:17:19 +0200
Subject: [Buildroot] [PATCH 1/1] support/cmake: Explicitly set
 CMAKE_SYSTEM
In-Reply-To: <20190803162432.GB26072@scaer> (Yann E. MORIN's message of "Sat, 
 3 Aug 2019 18:24:32 +0200")
References: <20190317164817.13998-1-frank.vanbever@mind.be>
 <20190803162432.GB26072@scaer>
Message-ID: <874l2yb23k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Franck, All,
 > Thanks for your contribution. I was finally able to wrap my head around
 > this cmake stuff... ;-)

 > On 2019-03-17 17:48 +0100, Frank Vanbever spake thusly:
 >> Some packages test for CMAKE_SYSTEM explicitly.[1]
 >> 
 >> CMAKE_SYSTEM is comprised of CMAKE_SYSTEM_NAME and CMAKE_SYSTEM_VERSION.
 >> It defaults to CMAKE_SYSTEM_NAME if CMAKE_SYSTEM_VERSION is not set.[2]
 >> 
 >> At the point CMAKE_SYSTEM_NAME is set to "Linux" CMAKE_SYSTEM is already
 >> constructed. Setting it explicitly ensures that it is the correct value.

 > This is because we do set CMAKE_SYSTEM_NAME twice, in fact:

 >   - first in toolchainfile.cmake, so that we tell cmake to use the
 >     "Buildroot" platform,

 >   - second, in the Buildroot.cmake platform definition itself, so that
 >     we eventually behave like the Linux platform.

 > I haven't been able to really track down exacty _when_ CMAKE_SYSTEM is
 > indeed set, but I believe it is done after the toolchainfile.cmake file
 > is parsed, but before the Buildroot.cmake platofrm one is. And indeed,
 > that becomes too late.

 > So, I believe this change is correct, but...

 > We also set CMAKE_SYSTEM_VERSION to 1, and so the real CMAKE_SYSTEM
 > value should be set to Linux-1 if we were to follow the documentation to
 > the letter.

 > However, for Linux, the version does not matter, and in some situations
 > may even be harmful (that was reported in one of the commits that
 > introduce Buildroot.cmake andtoolchanfile.cmake).

 > So:

 > Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks.

Committed after updating the commit message with the above description
from Yann, thanks.

-- 
Bye, Peter Korsgaard
