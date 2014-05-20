From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 20 May 2014 10:58:43 +0200
Subject: [Buildroot] Fwd: how to assign cpp and c++ in buildroot?
In-Reply-To: <CAMm5YqqFDD0a_hA0fGdiLDuHLoaCVVgf2L_-wzQikpF4cm7FJw@mail.gmail.com>
References: <52E9D80E-B9AD-417A-BC0F-66A69C39FC21@gmail.com>
 <5F503FD3-3FBC-4ADB-9D17-BA0CB5606B6D@gmail.com>
 <20140520000920.20ae6b5b@free-electrons.com>
 <0727D305-97AD-471C-BA2D-D6A251B4FA90@gmail.com>
 <CAMm5YqqFDD0a_hA0fGdiLDuHLoaCVVgf2L_-wzQikpF4cm7FJw@mail.gmail.com>
Message-ID: <CAAXf6LUF7eXsQvJRLoO0oHcefs9PGnUOVXGCNNhZ2YKV_SkGVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Cem,

On Tue, May 20, 2014 at 10:35 AM, cem akpolat <akpolatcem@gmail.com> wrote:
>
> Dear Thomas,
>
> The build root version: build root-2014.02
>
> MAKE OUTPUT:
> =====================================
>
>  [7m>>> expat 2.1.0 Configuring [27m
> (cd /home/cem/buildroot/buildroot-2014.02/output/build/expat-2.1.0/ && rm
> -rf config.cache &&
> PATH="/home/cem/buildroot/buildroot-2014.02/output/host/bin:/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin:/home/cem/buildroot/buildroot-2014.02/output/host/usr/sbin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
> AR="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ar"
> AS="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-as"
> LD="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld"
> NM="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-nm"
> CC="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc"
> GCC="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc"
> CPP="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-g++
> "
> CXX="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-g++"

Are you sure that you do not have any custom TARGET_CPP variable in
your environment, or made custom changes to buildroot?
The above command is composed using: (package/Makefile.in)

                GCC="$(TARGET_CC)" \
                CPP="$(TARGET_CPP)" \
                CXX="$(TARGET_CXX)" \

and these variables TARGET_xxxx are defined in the same file as:

TARGET_CC       = $(TARGET_CROSS)gcc
TARGET_CPP      = $(TARGET_CROSS)cpp
TARGET_CXX      = $(TARGET_CROSS)g++

I think the error you experience can only happen if you would have a
custom TARGET_CPP in your environment, which would overwrite the
definition above. The fact that there is an extra space between the
'g++' and the closing quote " also makes me believe you have something
custom in your environment/makefiles.

Could you check?

Thanks,
Thomas
