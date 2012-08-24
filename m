From: Evade Flow <evadeflow@gmail.com>
Date: Fri, 24 Aug 2012 09:06:48 -0400
Subject: [Buildroot] "Incorrect selection of the C library" with
	Emdebian toolchain
In-Reply-To: <5035736C.1020205@gmail.com>
References: <5035736C.1020205@gmail.com>
Message-ID: <50377C68.60502@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I guess I'm not going to use Emdebian, afterall. :-/ I'm attempting to
use buildroot, with an external toolchain, just to build a few libraries
(glib, libdbus-1, libcap) so I can run some diagnostics on an ARM
system. Specifically, I'd like to cross-compile bustle-pcap (see
http://www.willthompson.co.uk/bustle/) and run it on a target device at
work to see what the various apps are saying to each other over D-Bus. I
don't (yet) need to build a toolchain or root fs, I'm just looking for
an easy way to cross-compile glib & friends.

When I try to do this using buildroot + Emdebian (with the hard-coded
SYSROOT_DIR 'fix' I mentioned previously), it gets quite far into the
build, but then dbus-glib blows up with the errors show below. If I
attempt the same thing using buildroot + 'Sourcery CodeBench ARM
2011.09', it works fine.

It's frustrating that Emdebian *almost* works. I can't tell whether this
problem is the tip of a very large iceberg, or something that merely
requires a few minor patches to fix. Any recommendations about how
to fix the errors below?  Or is it unlikely to be worth the effort?
(I have no need to use Emdebian; I only chose it because I've used
it in the past and I'm somewhat familiar with it.)

----------

make[4]: Entering directory 
`/home/evadeflow/projects/buildroot-2012.05/output/build/dbus-glib-0.98/dbus'
   CC     dbus-glib.lo
   CC     dbus-gmain.lo
   CCLD   libdbus-glib-1.la
   CCLD   dbus-binding-tool
/usr/lib/gcc/arm-linux-gnueabi/4.6/../../../../arm-linux-gnueabi/bin/ld: 
warning: libffi.so.6, needed by 
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgobject-2.0.so, 
not found (try using -rpath or -rpath-link)
/usr/lib/gcc/arm-linux-gnueabi/4.6/../../../../arm-linux-gnueabi/bin/ld: 
warning: libz.so.1, needed by 
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so, 
not found (try using -rpath or -rpath-link)
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgobject-2.0.so: 
undefined reference to `ffi_type_void'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgobject-2.0.so: 
undefined reference to `ffi_type_double'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgobject-2.0.so: 
undefined reference to `ffi_prep_cif'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `inflate'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `deflateSetHeader at ZLIB_1.2.2'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgobject-2.0.so: 
undefined reference to `ffi_type_sint32'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `deflateReset'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `deflate'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgobject-2.0.so: 
undefined reference to `ffi_type_float'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgobject-2.0.so: 
undefined reference to `ffi_type_uint64'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgobject-2.0.so: 
undefined reference to `ffi_type_sint64'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `deflateInit2_'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `inflateGetHeader at ZLIB_1.2.2'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `deflateInit_'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgobject-2.0.so: 
undefined reference to `ffi_type_pointer'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgobject-2.0.so: 
undefined reference to `ffi_type_uint32'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `inflateEnd'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `deflateEnd'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `inflateInit_'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgobject-2.0.so: 
undefined reference to `ffi_call'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `inflateInit2_'
/home/evadeflow/projects/buildroot-2012.05/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/../lib/libgio-2.0.so: 
undefined reference to `inflateReset'
collect2: ld returned 1 exit status
make[4]: *** [dbus-binding-tool] Error 1
make[4]: Leaving directory 
`/home/evadeflow/projects/buildroot-2012.05/output/build/dbus-glib-0.98/dbus'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory 
`/home/evadeflow/projects/buildroot-2012.05/output/build/dbus-glib-0.98/dbus'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory 
`/home/evadeflow/projects/buildroot-2012.05/output/build/dbus-glib-0.98'
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/home/evadeflow/projects/buildroot-2012.05/output/build/dbus-glib-0.98'
make: *** 
[/home/evadeflow/projects/buildroot-2012.05/output/build/dbus-glib-0.98/.stamp_built] 
Error 2

On 8/22/12 8:03 PM, Evade Flow wrote:
> Hi. I'm having a problem similar to one reported earlier this year (see
> http://goo.gl/lBYtC), namely: SYSROOT_DIR is being computed incorrectly
> for my external toolchain. I'm trying to use Emdebian's ARM cross
> toolchain, which I installed in my Ubuntu 12.04 VM using:
>
> sudo apt-get install gcc-4.6-arm-linux-gnueabi
>
> This puts arm-linux-gnueabi-gcc-4.6 in /usr/bin, and the dependent
> package binutils-arm-linux-gnueabi adds things like
> arm-linux-gnueabi-ar, arm-linux-gnueabi-as, etc in the same location.
> However, the latter package also drops a bunch of files in
> /usr/arm-linux-gnueabi:
>
> /usr/arm-linux-gnueabi
> |-- bin
> | |-- ar
> | |-- as
> | |-- ld
> | |-- ld.bfd
> | |-- ld.gold
> | |-- nm
> | |-- objcopy
> | |-- objdump
> | |-- ranlib
> | `-- strip
> |-- include
> | |-- aio.h
> | |-- aliases.h
> | <--SNIP!-->
> | |-- wait.h
> | |-- wchar.h
> | |-- wctype.h
> | |-- wordexp.h
> | |-- xen
> | `-- xlocale.h
> `-- lib
> |-- crt1.o
> |-- crti.o
> |-- crtn.o
> |-- gcrt1.o
> |-- ld-2.15.so
> |-- ld-linux.so.3 -> ld-2.15.so
> |-- libanl-2.15.so
> <--SNIP--!>
> |-- libstdc++.so.6 -> libstdc++.so.6.0.16
> |-- libstdc++.so.6.0.16
> |-- libthread_db-1.0.so
> |-- libthread_db.so -> libthread_db.so.1
> |-- libthread_db.so.1 -> libthread_db-1.0.so
> |-- libutil-2.15.so
> |-- libutil.a
> |-- libutil.so -> libutil.so.1
> |-- libutil.so.1 -> libutil-2.15.so
> |-- Mcrt1.o
> `-- Scrt1.o
>
> So, as near as I can tell, SYSROOT_DIR should be /usr/arm-linux-gnueabi
> for this toolchain. The following sed command in ext-tool.mk (~ line
> 311) is the problem:
>
> SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e
> 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
>
> When the above is executed, LIBC_A_LOCATION has the value
> "/usr/arm-linux-gnueabi/lib/libc.a" so the regex doesn't match anything,
> and I get the error "Incorrect selection of the C library".
>
> For now, I've temporarily hacked ext-tool.mk to hard-code SYSROOT_DIR to
> '/usr/arm/arm-linux-gnueabi', which seems to work. Just figured I should
> tell some folks who may be able to implement a 'real' fix... :-}
