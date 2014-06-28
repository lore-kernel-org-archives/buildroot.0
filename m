From: Panahi Parsa <panahi.par3a@gmail.com>
Date: Sat, 28 Jun 2014 18:55:53 +0430
Subject: [Buildroot] Glibc LD_LIBRARAY_PATH error
In-Reply-To: <20140628083612.167f7b88@free-electrons.com>
References: <CAMhj5sakLa9ROf4RVO2N1rhRx+4du=j3X8OL5rLVRAUQRnFS+Q@mail.gmail.com>
 <20140628000126.4bfd6329@free-electrons.com>
 <CAMhj5sZkdpe+mrTzvxqrwK=-tOoyG4nvobM48PJJpw3oFcb5CA@mail.gmail.com>
 <20140628083612.167f7b88@free-electrons.com>
Message-ID: <CAMhj5sbiKrQ7PkbrxXr=CK34x2LA2bFu95asfCv8iKS5UtEMiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas

I looked at my LD_LIBRARY_PATH variable which I've set in /etc/bash.bashrc
and it is:

export PYLON_ROOT=/opt/pylon3
export GENICAM_ROOT_V2_3=${PYLON_ROOT}/genicam
export GENICAM_CACHE=${PYLON_ROOT}/xml_cache

export
LD_LIBRARY_PATH=${PYLON_ROOT}/lib64:${GENICAM_ROOT_V2_3}/bin/Linux64_x64:${GENICAM_ROOT_V2_3}/bin/Linux64_x64/GenApi/Generic

export LD_LIBRARY_PATH=/home/parsa/Softwares/OPENCV/build/lib

as you can see no :: is presented in this file so I don't know how to
remove this :: from LD_LIBRARY_PATH and remake buildroot.

Can you provide some info about removing this :: ?


2014-06-28 11:06 GMT+04:30 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Panahi Parsa,
>
> On Sat, 28 Jun 2014 09:15:18 +0430, Panahi Parsa wrote:
>
> >
> LD_LIBRARY_PATH=/opt/pylon3/lib64:/opt/pylon3/genicam/bin/Linux64_x64:/opt/pylon3/genicam/bin/Linux64_x64/GenApi/Generic::/home/parsa/Software/OPENCV/build/lib:/usr/local/lib:/home/parsa/Software/OPENCV/build/lib
>
> This LD_LIBRARY_PATH value, which has an empty member (notice the
> double : in the middle of the variable), is probably was confuses the
> glibc build system. Can you adjust your LD_LIBRARY_PATH to remove this
> empty member, and restart the build from scratch ("make clean all"),
> and let us know if that solves the problem? If it does, we'll add a
> check to warn users about this problem.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 


Parsa Panahi
D?partement de g?nie ?lectrique
?tudiant de l'?lectronique num?rique
Sharif Universit? de Technologie - T?h?ran - Iran
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140628/5a427a03/attachment.html>
