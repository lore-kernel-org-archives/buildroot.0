From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 15 Oct 2019 16:19:41 -0700
Subject: [Buildroot] Build failure on upgrade to 2019.08.1
In-Reply-To: <CAJJ6jxuOLe1Q+52dDamh7WSV_V6Fb=Sj_7NTWbF8tqCoVhBmow@mail.gmail.com>
References: <CAJJ6jxvGsZ0SYgivex5jGCHg21_acu=kp5CdRO2FF2K_xhUZwQ@mail.gmail.com>
 <fced002e-90cf-30e7-d515-f546daaf77bf@mind.be>
 <CAJJ6jxuRAd76-cOzKgGhtq0nvx+w0MeoMTCKdHzNmsGP+Rudzg@mail.gmail.com>
 <90524ee3-a438-fb38-da43-8632066743af@mind.be>
 <CAJJ6jxvGXS4L0fjp16WHGtdd6fKMhTPcCsS2aeaZPrkW0MBNYw@mail.gmail.com>
 <fbfd215f-42ec-74e8-b1b6-5650624d7ca0@mind.be>
 <CAJJ6jxvkTS5=9+v7N0BXQD2AWYvp9zEiRyPxtpNBYmjydL5zBw@mail.gmail.com>
 <d2390d24-80b1-7b88-dec9-08077ed1035d@mind.be>
 <CAJJ6jxuaETPxdROt48WMFMsgujNTRyPjTKEqfcnnrXV1-KE=QA@mail.gmail.com>
 <3473270f-4aa0-c40e-9f09-16ebfc3f8dc6@mind.be>
 <CAJJ6jxuOLe1Q+52dDamh7WSV_V6Fb=Sj_7NTWbF8tqCoVhBmow@mail.gmail.com>
Message-ID: <CAJJ6jxu_3kVxsO9CcY3uB1kJ0tMKOTGbDs3Lrj=RPNqWLar2tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 15, 2019 at 10:38 AM Steve Calfee <stevecalfee@gmail.com> wrote:
>
> Hi Arnout,
>
> Still failing in the same way. I am running ubuntu 16.04.6 LTS.
>
> I checked out the same versions as you and built as you said explicitly.
>
> <quote>
> built on master of a couple of days ago, using 'make toolchain'
> built on 2019.08.x of a couple of days ago, built with `make dbus`.
> </quote>
>
> This is very confusing. Maybe something is missing or wrong in my host
> environment?
>
> Steve
>
>
<snip>
> From the 1019.8.x branch I did make clean; make dbus. Here is the failure:
>
>   CCLD     dbus-update-activation-environment
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> warning: libpthread.so.0, needed by ../dbus/.libs/libdbus-1.so, not
> found (try using -rpath or -rpath-link)
<snip>

I don't understand why a .so is being used in a link?

In any case, if I change my defconfig to use the pre-built code
sourcery tool chain it no longer fails. So something is wrong with my
toolchain?

Here is a snip from the successful build:
  CCLD     dbus-update-activation-environment
  CCLD     dbus-cleanup-sockets
  CCLD     dbus-run-session
  CCLD     dbus-uuidgen
Making all in test
Making all in .
  CC       test-utils.lo
  GEN      uninstalled-config-local
  GEN      data/valid-config-files/session.conf
  GEN      data/valid-config-files-system/system.conf
  GEN      copy-config-local
-- No need to copy test data as srcdir = builddir
  CCLD     libdbus-testutils.la
Making all in name-test
make[5]: Nothing to be done for 'all'.
Making all in doc
make[4]: Nothing to be done for 'all'.
>>> dbus 1.12.10 Installing to staging directory
PATH="/home/calfee/edi-workspace/buildroot/output/host/bin:/home/calfee/edi-workspace/buildroot/output/host/sbin:/home/calfee/.cargo/bin:/home/calfee/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/microchip/xc32/v1.34/bin:/opt/microchip/xc16/v1.24/bin:/home/calfee/ti/ccs6/ccsv6/tools/compiler/gcc-arm-none-eabi-4_9-2015q3/bin:/opt/microchip/xc32/v1.34/bin:/opt/microchip/xc16/v1.24/bin:/home/calfee/ti/ccs6/ccsv6/tools/compiler/gcc-arm-none-eabi-4_9-2015q3/bin"
 /usr/bin/make -j5
DESTDIR=/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot
install -C /home/calfee/edi-workspace/buildroot/output/build/dbus-1.12.10/
Making install in dbus
