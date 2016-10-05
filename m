From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 10:01:31 +0200
Subject: [Buildroot] [PATCH] qt5: Disable passing of -isystem flag in
 CXXFLAGS
In-Reply-To: <1474642729-40702-1-git-send-email-abrodkin@synopsys.com>
References: <1474642729-40702-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20161005100131.7c0a4a38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 17:58:49 +0300, Alexey Brodkin wrote:
> Some Qt5 sub-projects as well as 3rd-party apps written on Qt
> are failing to compile with gcc 6.x like that:
> ---------------------------->8-------------------------  
> In file included from XXX/output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/bits/stl_algo.h:59:0,
>                  from XXX/output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/algorithm:62,
>                  from XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/qt5/QtCore/qglobal.h:88,
>                  from XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/qt5/QtCore/qpair.h:37,
>                  from qmediametadata.h:37,
>                  from qmediametadata.cpp:28:
> XXX/output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
>  #include_next <stdlib.h>
>                          ^
> compilation terminated.
> ---------------------------->8-------------------------  

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
