From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 13 Apr 2020 15:01:16 +0200
Subject: [Buildroot] [PATCH v1] package/assimp: fix static only compile
In-Reply-To: <20200412232237.4bf4011f@windsurf.home>
References: <20200412163525.21139-1-ps.report@gmx.net>
 <20200412232237.4bf4011f@windsurf.home>
Message-ID: <20200413150116.1616f49d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 12 Apr 2020 23:22:37 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Sun, 12 Apr 2020 18:35:25 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Add patch to disable internal dynamic zlib library building, fixes
> > compile failure for static only toolchains (and assimp links
> > against the static one).
> >
> > Fixes:
> >
> >   http://autobuild.buildroot.net/results/7c2db184ee200d1719308f38f42382bb39d8d5c6
> >
> >   [13%] Linking C shared library ../../lib/libzlib.so
> >   .../arm-buildroot-linux-uclibcgnueabi/bin/ld: .../host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
> >   __uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
> >   .../arm-buildroot-linux-uclibcgnueabi/bin/ld: __uClibc_main.c:(.text+0x160): undefined reference to `__fini_array_end'
> >   .../arm-buildroot-linux-uclibcgnueabi/bin/ld: final link failed: bad value
> >   collect2: error: ld returned 1 exit status
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...lib-disable-dynamic-library-building.patch | 31 +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644 package/assimp/0003-contrib-zlib-disable-dynamic-library-building.patch
>
> Applied to master, thanks. I assume you have submitted the patch
> upstream :-)

Yep, just done (see [1])...

Regards,
Peter

[1] https://github.com/assimp/assimp/pull/3146

>
> Thomas
