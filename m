From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Aug 2015 23:05:27 +0200
Subject: [Buildroot] [PATCH] qt5: disable for static-only builds
In-Reply-To: <1440601578-6669-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 26 Aug 2015 17:06:18 +0200")
References: <1440601578-6669-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r3mpwyjs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Even though we have some specific code to support building Qt5 for
 > static-only configurations, it doesn't work. The first problem is that
 > our custom qmake.conf always passes -ldl, which makes a number of Qt5
 > config.tests fail at configure time. Once this problem is fixed by
 > removing -ldl from QMAKE_LIBS and adding it to QMAKE_LIBS_DYNLOAD
 > instead, the next problem is that the plugin infrastructure of Qt5
 > assumes that Linux has dynamic library support: the qlibrary_unix.cpp
 > file includes <dlfcn.h>, and the only condition for this file to not
 > be included is:

 > Until recently, building Qt5 statically was working because our C
 > library was not built static-only: it provided <dlfcn.h> and
 > libdl.so. But now that we have a really static only toolchain, Qt5 no
 > longer builds.

 > The easiest solution is to simply make Qt5 depend on dynamic library
 > support.

Yes, I agree. Committed, thanks.

-- 
Bye, Peter Korsgaard
