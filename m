From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Mar 2018 13:22:18 +0200
Subject: [Buildroot] [PATCH v1 1/2] gnutls: needs C++ support
In-Reply-To: <20180327075631.GE30827@x230> (Petr Vorel's message of "Tue, 27
 Mar 2018 09:56:33 +0200")
References: <20180321202312.23021-1-ps.report@gmx.net>
 <20180327075631.GE30827@x230>
Message-ID: <87woxxsqz9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

Hi,

 >> config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 >> bool "multimedia support"

 > The only thing I can know and can confirm on this issue is that Connman and NetworkManager
 > depend on GnuTLS (NetworkManager can use NSS, but that IMHO not in buildroot).

It is (libnss).

 > Looking at GnuTLS it looks like it includes <cstdlib>, hence really depends on C++
 > toolchain.

Yes, but those are conditionally includes:

/* Many header files from the libstdc++ coming with g++ 3.3 or newer include
   <libintl.h>, which chokes if dcgettext is defined as a macro.  So include
   it now, to make later inclusions of <libintl.h> a NOP.  */
#if defined(__cplusplus) && defined(__GNUG__) && (__GNUC__ >= 3)
# include <cstdlib>
# if (__GLIBC__ >= 2 && !defined __UCLIBC__) || _GLIBCXX_HAVE_LIBINTL_H
#  include <libintl.h>
# endif
#endif

-- 
Bye, Peter Korsgaard
