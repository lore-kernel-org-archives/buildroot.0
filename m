From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Tue, 24 Sep 2013 18:41:21 +0200
Subject: [Buildroot] [PATCH] Add pyside + shiboken packages
In-Reply-To: <20130921093843.7fe3ea0e@skate>
References: <523ACBFA.2070401@wanadoo.fr> <20130919173426.47c2bba8@skate>
 <523C5EFC.5040204@wanadoo.fr> <20130920175457.65a4d63c@skate>
 <523D3196.9090702@wanadoo.fr> <20130921093843.7fe3ea0e@skate>
Message-ID: <5241C0B1.7060408@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>
> If they are CMake based packages, then they should use the
> cmake-package infrastructure. Of course, if they have some tricky
> aspects, we might need to adapt/improve the cmake-package
> infrastructure if needed.
>

There are (at least) 2 tricky aspects indeed.

1) Shiboken does not support to be built in place. A build directory is 
mandatory. (Else it fails, because it attempts to link the "shiboken" 
binary at a location where the is a directory of the same name)
FYI, see: http://qt-project.org/wiki/Building_PySide_on_Linux

For now I cannot see such an option in the Cmake infrastructure in 
buildroot.
Would that be a potential improvement ?

2) When compiling the host version, it fails with that error:

  from 
/nous/BASYSTEMES/buildroot/output/build/host-shiboken-1.2.1/ApiExtractor/apiextractor.cpp:24:
/nous/BASYSTEMES/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/gnu/stubs.h:7:29: 
error: gnu/stubs-soft.h: no such file or directory

The issue is that looking at the headers in the sysroot cannot work,
I am using BR2_ARM_FPU_NEON for my target, I suspect that I do not have 
got the soft stubs due to that.
Anyway, shouldn't the host build rather take host headers instead ?

Best regards
Thierry
