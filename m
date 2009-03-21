From: Robert Urban <urban@unix-beratung.de>
Date: Sun, 22 Mar 2009 00:21:19 +0100
Subject: [Buildroot] how to get compilation environment right?
Message-ID: <49C5766F.3050207@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

I'm trying to build cpufrequtils-005, which doesn't use configure.  Instead
it has a simple makefile:

	http://www.spielwiese.de/rob/Buildroot/Makefile

which uses libtool to compile library objects as follows:

	$(LIBTOOL) $(LIBTOOL_OPT) --mode=compile \
		$(CC) $(CFLAGDEF) $(CFLAGS) -o $@ -c $*.c

the library gets built without errors, but when make tries to link a utility
which uses the library, I see complaints about undefined symbols in the form
of "function at GLIBC_2.0", and that "libc.so.6" (which is the host libc) is
needed, but not found.

If I compare a gcc line from cpufrequtils to something sucessful, I notice
that the gcc flags "-sysroot" and "-isysroot" are not present, which would
seem to explain why the host libc is being linked against.

What is the proper method of sorting out such problems?

thanks,

Rob Urban

P.S. the buildroot config I'm using can be seen here:

	http://www.spielwiese.de/rob/Buildroot/config
