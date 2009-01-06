From: Aaron Hanson <a.hanson@f5.com>
Date: Tue, 6 Jan 2009 12:08:05 -0800
Subject: [Buildroot] development environment
Message-ID: <1055A7403DE8F74B8C837B787EDA362F23264F5F@exch10.olympus.f5net.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All -

        I'm having great success creating a complete target image and booting it. Buildroot is wonderful. But I want development tools in the target system, and I'm getting a very basic error when I try to use gcc:

# gcc foo.c
/usr/bin/ld: cannot find -lgcc
collect2: ld returned 1 exit status

        I work around this with a symlink:

/usr/lib/libgcc.so -> libgcc_s.so.1

        But then I'm stuck:

# gcc foo.c
/usr/bin/ld: cannot find /usr/lib/uclibc_nonshared.a
collect2: ld returned 1 exit status

        It seems I've not built the toolchain correctly. I'm using buildroot and uclibc menu-config and throwing in all the development options I can find. Does this particular problem have an obvious meaning to anybody? Is there a static-lib setting that I'm missing?

        Thanks...

-Aaron
