From: zevv <uclibc@zevv.nl>
Date: Fri, 21 Dec 2007 04:19:05 -0800 (PST)
Subject: [Buildroot]  Changing uclibc runtime prefix
Message-ID: <14454607.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello all,

I'm trying to deploy uClibc on a system with another C library on it, so
that I'll be able to run binaries linked to either one of the libc's.

I'd like to install uClibc in /usr/i386-uclibc/*, and configure the
cross-gcc and binutils to link against this library. I'm using buildroot to
generate the toolchain only.

Problem is that I can't get buildroot to configure uclibc and gcc the way I
want. My configuration
is as follows:

buildroot configuration (make menuconfig)

  CONFIG_BR2_STAGING_DIR = /usr/i386-uclibc/

uclibc configuration (make uclibc-menuconfig)

  CONFIG_SHARED_LIB_LOADER_PREFIX = /usr/i386-uclibc/lib  
  CONFIG_RUNTIME_PREFIX  /usr/i386-uclibc/

The result is a uClibc and toolchain installed in /usr/i386-uclibc as
expected. The ld-library loader is installed in
/usr/i386-uclibc/lib/ld-uClibc.so.0 as well, just as it should.

The problem is that all binaries compiled with this toolchain, are still
expecting the ld library loader to be /lib/ld-uClibc.so.0, instead of
/usr/i386-uclibc/lib/ld-uClibc.so.0 !

My only conclusion is that I'm probably doing something wrong or have a
wrong understanding of what's happening here. Any tips on how to get this
working as described above ?

Thank you very much for your time,

Ico


-- 
View this message in context: http://www.nabble.com/Changing-uclibc-runtime-prefix-tp14454607p14454607.html
Sent from the BuildRoot mailing list archive at Nabble.com.
