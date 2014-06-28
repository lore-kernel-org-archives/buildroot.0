From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jun 2014 08:36:12 +0200
Subject: [Buildroot] Glibc LD_LIBRARAY_PATH error
In-Reply-To: <CAMhj5sZkdpe+mrTzvxqrwK=-tOoyG4nvobM48PJJpw3oFcb5CA@mail.gmail.com>
References: <CAMhj5sakLa9ROf4RVO2N1rhRx+4du=j3X8OL5rLVRAUQRnFS+Q@mail.gmail.com>
 <20140628000126.4bfd6329@free-electrons.com>
 <CAMhj5sZkdpe+mrTzvxqrwK=-tOoyG4nvobM48PJJpw3oFcb5CA@mail.gmail.com>
Message-ID: <20140628083612.167f7b88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Panahi Parsa,

On Sat, 28 Jun 2014 09:15:18 +0430, Panahi Parsa wrote:

> LD_LIBRARY_PATH=/opt/pylon3/lib64:/opt/pylon3/genicam/bin/Linux64_x64:/opt/pylon3/genicam/bin/Linux64_x64/GenApi/Generic::/home/parsa/Software/OPENCV/build/lib:/usr/local/lib:/home/parsa/Software/OPENCV/build/lib

This LD_LIBRARY_PATH value, which has an empty member (notice the
double : in the middle of the variable), is probably was confuses the
glibc build system. Can you adjust your LD_LIBRARY_PATH to remove this
empty member, and restart the build from scratch ("make clean all"),
and let us know if that solves the problem? If it does, we'll add a
check to warn users about this problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
