From: Kuten Ivan <ivan.kuten@promwad.com>
Date: Wed, 24 Oct 2007 16:17:46 -0100
Subject: [Buildroot] libglib2 error - Please help me
In-Reply-To: <9ed1d6350710220351q1925cd8cs6741841dc44f0cbf@mail.gmail.com>
References: <9ed1d6350710220351q1925cd8cs6741841dc44f0cbf@mail.gmail.com>
Message-ID: <471F7E3A.40003@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?mer Celikkanat wrote:
> Hi people,
> 
> I have a problem with the package "libglib2". I get this compiler eror:
...
> -Wl,--rpath -Wl,/home/ocelikkanat/buildroot/build_i386/staging_dir/usr/lib
> ../glib/.libs/libglib-2.0.so: undefined reference to `wcscoll'
> ../glib/.libs/libglib-2.0.so: undefined reference to `_stdlib_mb_cur_max'
> ../glib/.libs/libglib-2.0.so: undefined reference to `wcsxfrm'

What uclibc config are you using?

You have to use:
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29-wchar.config"
and not this which is a default one:
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"


BR,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
