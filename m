From: Michael.Forkey at elektrobit.com <Michael.Forkey@elektrobit.com>
Date: Fri, 15 Aug 2008 13:51:56 -0700
Subject: [Buildroot] Can't compile uClibc w/Locale support for ARM9 - older
	buildroot
Message-ID: <C681C76E0D5F1E4BB01DE79E0A80EEC7A9972F@usrdes03.ebgroup.elektrobit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

target: arm926t
host: x86
I don't know precisely what version of the tools I am using. The
buildroot tarball my customer sent is from Nov 30, 2007 (SVN #20599.)  I
have to use that version.


I am trying to build uClibc with locale support enabled for strings. Per
the buildroot instructions I built the toolchain first without updating
uClibc's configuration. Then I went back afterward and changed uClibc's
configuration enabling locale support under Strings. Below is a portion
of the resulting make output. 

Anyone know what is wrong? I get this same error on an Ubuntu 8.04 VM
and a Red Hat server.

I notice the ".//..." at the beginning of
".//include/bits/uClibc_ctype.h". $(top_builddir) should be expanded
there. Since it is not I think that indicates it is not set properly.
But I don't know how to fix that. I tried the obvious (setting the value
of top_builddir myself, hard coding the expanded string in the makefile)
but none of those worked. I just get other errors.

Thanks for any help.
mf

./extra/scripts/conf-header.sh .config > include/bits/uClibc_config.h
/usr/bin/make -j1 locale_headers
/usr/bin/gcc extra/locale/gen_wc8bit.c  -o extra/locale/gen_wc8bit
-O2 -Wall  -D__UCLIBC_GEN_LOCALE
-DUCLIBC_CTYPE_HEADER='".//include/bits/uClibc_ctype.h"'
-DCTYPE_PACKED=1 -DDO_WIDE_CHAR=1
extra/locale/gen_wc8bit.c:21:29: error: .//include/bits/uClibc_ctype.h:
No such file or directory
extra/locale/gen_wc8bit.c: In function 'main':
extra/locale/gen_wc8bit.c:300: error: '__CTYPE_unclassified' undeclared
(first use in this function)
extra/locale/gen_wc8bit.c:300: error: (Each undeclared identifier is
reported only once
extra/locale/gen_wc8bit.c:300: error: for each function it appears in.)
extra/locale/gen_wc8bit.c:302: error: '__CTYPE_digit' undeclared (first
use in this function)


----------------------------------------------------------------
Please note: This e-mail may contain confidential information
intended solely for the addressee. If you have received this
e-mail in error, please do not disclose it to anyone, notify
the sender promptly, and delete the message from your system.
Thank you.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080815/e4ac8e3f/attachment.htm 
