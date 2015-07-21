From: Christian Stewart <christian@paral.in>
Date: Tue, 21 Jul 2015 22:55:26 +0000
Subject: [Buildroot] ncurses build failing
In-Reply-To: <CA+h8R2p0R+zg3wk6ewYDgCzvRev-cQe3H_WQ0hfF14Z6O1CWqA@mail.gmail.com>
References: <CA+h8R2p0R+zg3wk6ewYDgCzvRev-cQe3H_WQ0hfF14Z6O1CWqA@mail.gmail.com>
Message-ID: <CA+h8R2qDpcW8Voux-6RON40-kFn6qcU-GUw4h2k6qK+Qe__g=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This bug with ncurses was introduced with the update to GCC 5.2.x on July
17th in c516971.

There was a commit on May 27th, 4297e7298, that claimed to fix a similar
bug with 5.x. The update to 5.2 seems to have broken this fix.

Christian

On Tue, Jul 21, 2015 at 3:44 PM Christian Stewart <christian@paral.in>
wrote:

> I'm getting the following build error on the latest Buildroot master
> version:
>
>  [7m>>> ncurses 5.9 Building [27m
> /usr/bin/make -j1 -C /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/build/ncurses-5.9 DESTDIR=/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot sources
> cd include && /usr/bin/make - --no-print-directory -- DESTDIR=/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot DESTDIR="/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot" sources
> make[3]: Nothing to be done for `sources'.
> cd ncurses && /usr/bin/make - --no-print-directory -- DESTDIR=/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot DESTDIR="/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot" sources
> make[3]: Nothing to be done for `sources'.
> cd panel && /usr/bin/make - --no-print-directory -- DESTDIR=/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot DESTDIR="/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot" sources
> make[3]: Nothing to be done for `sources'.
> cd menu && /usr/bin/make - --no-print-directory -- DESTDIR=/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot DESTDIR="/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot" sources
> make[3]: Nothing to be done for `sources'.
> cd form && /usr/bin/make - --no-print-directory -- DESTDIR=/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot DESTDIR="/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot" sources
> make[3]: Nothing to be done for `sources'.
> cd misc && /usr/bin/make - --no-print-directory -- DESTDIR=/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot DESTDIR="/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot" sources
> /bin/sh ./gen-pkgconfig
> touch pc-files
> rm -rf /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/build/ncurses-5.9/misc/pc-files
> /usr/bin/make -j5 -C /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/build/ncurses-5.9 DESTDIR=/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot
> cd include && /usr/bin/make - --no-print-directory - --jobserver-fds=3,4 -j -- DESTDIR=/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot DESTDIR="/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot" all
> make[3]: Nothing to be done for `all'.
> cd ncurses && /usr/bin/make - --no-print-directory - --jobserver-fds=3,4 -j -- DESTDIR=/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot DESTDIR="/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot" all
> /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/bin/ccache /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DHAVE_CONFIG_H -I../ncurses -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DNDEBUG -I. -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -O2   --param max-inline-insns-single=1200 -fPIC -c ../ncurses/lib_gen.c -o ../obj_s/lib_gen.o
> /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/bin/ccache /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DHAVE_CONFIG_H -I../ncurses -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DNDEBUG -I. -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -O2   --param max-inline-insns-single=1200 -fPIC -c ../ncurses/./base/lib_redrawln.c -o ../obj_s/lib_redrawln.o
> /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/bin/ccache /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DHAVE_CONFIG_H -I../ncurses -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DNDEBUG -I. -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -O2   --param max-inline-insns-single=1200 -fPIC -c ../ncurses/./base/lib_refresh.c -o ../obj_s/lib_refresh.o
> /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/bin/ccache /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DHAVE_CONFIG_H -I../ncurses -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DNDEBUG -I. -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -O2   --param max-inline-insns-single=1200 -fPIC -c ../ncurses/./base/lib_restart.c -o ../obj_s/lib_restart.o
> /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/bin/ccache /home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DHAVE_CONFIG_H -I../ncurses -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DNDEBUG -I. -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -O2   --param max-inline-insns-single=1200 -fPIC -c ../ncurses/./base/lib_scanw.c -o ../obj_s/lib_scanw.o
> _16821.c:835:22: Fehler: expected ?)? before ?int?
> make[3]: *** [../obj_s/lib_gen.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [all] Error 2
> make[1]: *** [/home/brommer/Dokumente/project_data/steward_stuff/buildroot/output/build/ncurses-5.9/.stamp_built] Error 2
> make: *** [_all] Error 2
>
>
> Expected ) before int in _16821.c:835:22
>
> Any idea what would be causing this? I believe it was introduced recently.
>
> Thanks,
> Christian
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150721/179f5bc2/attachment.html>
