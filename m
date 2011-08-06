From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 6 Aug 2011 02:38:37 -0700
Subject: [Buildroot] libssp still missing from target
In-Reply-To: <20110805003419.4934e4bf@skate>
References: <j1eiv7$irk$1@dough.gmane.org> <20110805003419.4934e4bf@skate>
Message-ID: <CAJaTeTp2NQsFuaispx_U79GuYzdNMoPbaRJJdijZC-XL7Rwfow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 4, 2011 at 15:34, Thomas Petazzoni wrote:
> I guess libssp only exists on toolchains that have stack protection
> support enabled. None of my CodeSourcery or Buildroot-built toolchains
> have a libssp. I guess I'll have to build a CT-NG toolchain with libssp
> support.

not exactly.  libssp is a configure option when gcc is built.  you can
either force gcc to build/use a dedicated libssp.so, but this is
redundant when using glibc or uClibc which includes the required
symbols in its libc/ldso.

so any code in buildroot would need to detect if libssp is available
and only copy it over if so.
-mike
