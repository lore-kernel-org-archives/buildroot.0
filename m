From: Panahi Parsa <panahi.par3a@gmail.com>
Date: Sat, 28 Jun 2014 19:42:39 +0430
Subject: [Buildroot] Glibc LD_LIBRARAY_PATH error
In-Reply-To: <20140628162843.41a203d7@free-electrons.com>
References: <CAMhj5sakLa9ROf4RVO2N1rhRx+4du=j3X8OL5rLVRAUQRnFS+Q@mail.gmail.com>
 <20140628000126.4bfd6329@free-electrons.com>
 <CAMhj5sZkdpe+mrTzvxqrwK=-tOoyG4nvobM48PJJpw3oFcb5CA@mail.gmail.com>
 <20140628083612.167f7b88@free-electrons.com>
 <CAMhj5sbiKrQ7PkbrxXr=CK34x2LA2bFu95asfCv8iKS5UtEMiQ@mail.gmail.com>
 <20140628162843.41a203d7@free-electrons.com>
Message-ID: <CAMhj5saaeT9uoHNk2CZLf8da=ds8Zr0r2va15GFdZwrqxe0ENA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas
you're right I've this one in my /etc/profile

export PYLON_ROOT=/opt/pylon3
export GENICAM_ROOT_V2_3=${PYLON_ROOT}/genicam
export GENICAM_CACHE=${PYLON_ROOT}/xml_cache

export
LD_LIBRARY_PATH=${PYLON_ROOT}/lib64:${GENICAM_ROOT_V2_3}/bin/Linux64_x64:${GENICAM_ROOT_V2_3}/bin/Linux64_x64/GenApi/Generic:$LD_LIBRARY_PATH

export
LD_LIBRARY_PATH=/home/parsa/Softwares/OPENCV/build/lib:$LD_LIBRARY_PATH

I ran your command and it is downloading and making packages and I think it
takes a long time. If I see the problem is solved I'll tell you about it.

Thanks again.


2014-06-28 18:58 GMT+04:30 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Panahi Parsa,
>
> On Sat, 28 Jun 2014 18:55:53 +0430, Panahi Parsa wrote:
>
> > I looked at my LD_LIBRARY_PATH variable which I've set in
> /etc/bash.bashrc
> > and it is:
> >
> > export PYLON_ROOT=/opt/pylon3
> > export GENICAM_ROOT_V2_3=${PYLON_ROOT}/genicam
> > export GENICAM_CACHE=${PYLON_ROOT}/xml_cache
> >
> > export
> >
> LD_LIBRARY_PATH=${PYLON_ROOT}/lib64:${GENICAM_ROOT_V2_3}/bin/Linux64_x64:${GENICAM_ROOT_V2_3}/bin/Linux64_x64/GenApi/Generic
> >
> > export LD_LIBRARY_PATH=/home/parsa/Softwares/OPENCV/build/lib
>
> If you really have this code, then LD_LIBRARY_PATH would be equal to
> just /home/parsa/Softwares/OPENCV/build/lib, because this last command
> overrides any previous value of LD_LIBRARY_PATH. So clearly, you have
> other pieces of code that are touching LD_LIBRARY_PATH.
>
> Can you try, within the Buildroot source directory:
>
> unset LD_LIBRARY_PATH
> make clean all
>
> Thanks,
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140628/9dbecaa5/attachment.html>
