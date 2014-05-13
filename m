From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 09:44:26 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-11
In-Reply-To: <20140512063008.74E21100DB2@stock.ovh.net>
References: <20140512063008.74E21100DB2@stock.ovh.net>
Message-ID: <20140513094426.335d2361@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 May 2014 08:30:08 +0200 (CEST), Thomas Petazzoni wrote:

>      nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/7864cd5789a9f9b9f0603d738f4e63822d8469dd/

Will be fixed once http://patchwork.ozlabs.org/patch/348125/ is
committed.

>    powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/6a89535c0806939dcb6d4160899bd242a0648fb8/

uClibc static linking issue.

>     mipsel |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/8ca7fb8e4b1da8c1a7e4d646469779e4032877ab/

/home/test/test/2/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libasound.a(control_shm.o): In function `_snd_ctl_shm_open':
control_shm.c:(.text+0x1550): warning: gethostbyname is obsolescent, use getnameinfo() instead.
/home/test/test/2/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libasound.a(rawmidi_symbols.o):(.data.rel+0x4): undefined reference to `_snd_module_rawmidi_virt'
collect2: error: ld returned 1 exit status

>       bfin |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/a28df0ba10803e6e54c2f8160bbd8190cba4d690/

Weird stuff going on. Samuel?

>      avr32 |             btrfs-progs-3.14.1 | NOK | http://autobuild.buildroot.net/results/06501fd32c30549810c12f0ad50f510c4b74ee63/

Gustavo? Probably simply exclude btrfs-progs from avr32 ?

> microblazeel |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f94aa7382de01decbf0cd24f00a4ad4c0da1d5af/

Some Microblaze person? Waldemar maybe?

>       i686 |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/036601736a9d593f7731cefff24a6364e95b5550/

Should be fixed by:

  http://git.buildroot.net/buildroot/commit/?id=b11289752e5f862afeced9f34bfab2e6a521b776
  http://git.buildroot.net/buildroot/commit/?id=c95a30471da61bd8b1396d85fd4401c0cf7901c8

>    powerpc |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f1ca1a8f7ca8456003c6f17e146151a99835c4c0/

/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/4.7.3/../../../../powerpc-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/4.7.3/../../../../powerpc-buildroot-linux-uclibc/lib/libstdc++.so'

Gustavo, what is the status on this issue?

>        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/9b7870354d70e27e42d3d9c1f131ab54706bf20e/

Caused by the selection of multiple different providers: rpi for
OpenVG, gpu-viv-bin-mx6q for EGL and mesa3d for GLES. In discussion
with Yann.

>      avr32 |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/a26574419aacbea4140dfca1d503bcab599edd71/

Fixed by http://git.buildroot.net/buildroot/commit/?id=f015ad1c7b7453b38b19356882d434254f23b9cf.

>      nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/272f18410e4855ab6b3bfd8a44243c1ebecf6abe/

Fixed by http://git.buildroot.net/buildroot/commit/?id=f287f0aab695b2a36bd1abc776e2ccfddee6c3fb.

>       bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/993247d885172e64eea4f630558633a6ee488986/

{standard input}: Assembler messages:
{standard input}:4: Error: syntax error. Input text was _compat.elfutils_0.122.dwarf_bytesize.
{standard input}:4: Error: 
make[4]: *** [dwarf_bytesize.os] Error 1

>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/01a23f0f014cfa6d28d65756437ac044adfae206/

I tried to investigate this again yesterday, but I'm still unable to
reproduce :/

>       bfin |                  host-gdb-6.6a | NOK | http://autobuild.buildroot.net/results/67708ae5907a5330bc1d06d38281357b0856922f/

configure: error: "*** Gdb does not support target bfin-buildroot-uclinux-uclibc"

Hum, that's weird, we have gdb 6.6 specifically for Blackfin. Maybe
more recent gdb versions have Blackfin support and we could drop 6.6 ?

>       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/c2955bd85f98106692a849858ea4947bf7bcc1fb/
>       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/7d628f590a5a99f6fff97c02db6197789c7e01d1/
>       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/76173e148207d1238cb970c69d2c35151f1fd468/
>       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/a2ebc5745a3f16d5b7090a7414ffd0c1d535b022/

Fixed by http://git.buildroot.net/buildroot/commit/?id=0f6fca606134b81c13a9cd03169158a24e3346f5.

>     x86_64 | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/ca81fb8e31a976513772970358f8d399bebc8fa8/

Rather weird:

The project was not configured: run "waf configure" first!
make: *** [/home/test/test/1/output/build/jack2-ab409a65df95bc261ff72b52d6b3f4a65cf3266a/.stamp_built] Error 1

>        arm |                   libeio-1.7.7 | NOK | http://autobuild.buildroot.net/results/27854bf8425d64dbb475653161bbf1f386173366/

Fixed by http://git.buildroot.net/buildroot/commit/?id=7ed76d5427639987bfdf22ecf2cd10cdea1e8f95.

>        arm |                      lsof-4.85 | NOK | http://autobuild.buildroot.net/results/a1f0572dbf968c21f70b35cefff7ef7a1d9a348a/

Missing TCP_* definitions. Weird because the toolchain has recent
kernel headers (3.12) and uses glibc. Investigation needed.

>        arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/908ba3ab5a830696dea649f1623f74579083f4c8/

Fixed by http://git.buildroot.net/buildroot/commit/?id=85082cab93b282021006ddee63793403b90ffe1f.

>        arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/71978ab25e521e4b06337a98d9a4aeb73c710b53/

Same bug, but different toolchain. I'll have to add an exception in the
autobuilders, it seems. And Crosstool-NG should carry a fix for PR58595.

>       sh4a |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/f935c159dcafe7fd31caaddfeb93f75ddf6fa903/
>    powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/d0014fc462016361e0f33707932f5fce7d8fd832/
>    powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/d63de54ae546f434a4872da0ccc1f9cc685fd8b6/
>        sh4 |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/400895373468b137138a0522bc00800b80ac3526/
>    powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/071ad52698e199eb762387d22ae83d8e6635e20c/
>    powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/1d65724a1206ec15842f7704b63c7ebd4c99d077/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=8677473035cc3e02281c8998c25d6dfa071f3b54.

>    powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/05d6d0bd1b001fb7027589768cbb25cd0d18f52b/
>    powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/e3765ce8f7f02045e7fe8bd578735bdd5499288e/

Another gcc issue.

>     mipsel |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/070a19eb24f0b3d1516679ed3e2d1a54dae2d7cf/

OpenGL issue:

 /home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/4.7.3/../../../../mipsel-buildroot-linux-uclibc/bin/ld: cannot find -lGL

Bernd maybe?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
