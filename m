From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jan 2014 22:08:50 +0100
Subject: [Buildroot] [PATCH v2 1/5] pkg-cmake.mk: build shared library
	when !BR2_PREFER_STATIC_LIB
In-Reply-To: <1390424381-6889-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Wed, 22 Jan 2014 21:59:37 +0100")
References: <1390424381-6889-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87k3drd8rh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > CMake offers a couple of places where one can specify how to build a
 > library:
 > - when you create the library target itself, by calling
 >   add_library(target [SHARED|STATIC] ...)
 > - or globally, when you configure the build, by setting the
 >   BUILD_SHARED_LIBS CMake flag.

 > * if the library target kind of library is specified:
 >     it overrides the global setting BUILD_SHARED_LIBS;
 > * else, if the global setting BUILD_SHARED_LIBS is set:
 >     it builds according to the BUILD_SHARED_LIBS flags;
 > * otherwise:
 >     for linux, it will build static library (like BUILD_SHARED_LIBS
 >     default is OFF).

 > So, we can consider the setting BUILD_SHARED_LIBS acts a bit similarly
 > to the autotools ones '--disable-static' and '--enable-shared'.
 > Thus, it makes sense for Buildroot to globally drive to CMake flags in
 > the cmake-package infrastructure.

 > It seems we never trigger this so far because:
 > - either we specified it in the *.mk file (e.g. opencv.mk);
 > - or it was already set per target by the projects' upstreams.

 > Followup patches will clean the remaining BUILD_SHARED_LIBS in the
 > package *.mk files.

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed series, thanks.

-- 
Bye, Peter Korsgaard
