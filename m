From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 12:55:42 +0100
Subject: [Buildroot] [PATCH 3/4] package/wpewebkit: needs >= GCC 7
In-Reply-To: <20200215150929.13293-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 15 Feb 2020 16:09:27 +0100")
References: <20200215150929.13293-1-peter@korsgaard.com>
 <20200215150929.13293-3-peter@korsgaard.com>
Message-ID: <877e0miw5d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > CMakeLists.txt contains a toolchain check:
 > if (${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
 >     if (${CMAKE_CXX_COMPILER_VERSION} VERSION_LESS "7.3.0")
 >         message(FATAL_ERROR "GCC 7.3 or newer is required to build WebKit. Use a newer GCC version or Clang.")
 >     endif ()
 > endif ()

 > So bump the toolchain dependency to >= GCC 7.  The check is really about >=
 > 7.3.0, but we do not have such detailed version checks.  Given that GCC
 > 7.3.0 was released in January 2018 (and 7.1.0 in May 2017), most external
 > GCC 7.x toolchains probably use >= 7.3.0.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
