From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 27 Mar 2018 16:23:33 +0200
Subject: [Buildroot] [PATCH v1 1/2] gnutls: needs C++ support
In-Reply-To: <87woxxsqz9.fsf@dell.be.48ers.dk>
References: <20180321202312.23021-1-ps.report@gmx.net>
 <20180327075631.GE30827@x230> <87woxxsqz9.fsf@dell.be.48ers.dk>
Message-ID: <20180327142332.nvz56qsiecsw3cub@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> Hi,

>  >> config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
>  >> bool "multimedia support"

>  > The only thing I can know and can confirm on this issue is that Connman and NetworkManager
>  > depend on GnuTLS (NetworkManager can use NSS, but that IMHO not in buildroot).

> It is (libnss).

>  > Looking at GnuTLS it looks like it includes <cstdlib>, hence really depends on C++
>  > toolchain.

> Yes, but those are conditionally includes:

> /* Many header files from the libstdc++ coming with g++ 3.3 or newer include
>    <libintl.h>, which chokes if dcgettext is defined as a macro.  So include
>    it now, to make later inclusions of <libintl.h> a NOP.  */
> #if defined(__cplusplus) && defined(__GNUG__) && (__GNUC__ >= 3)
> # include <cstdlib>
> # if (__GLIBC__ >= 2 && !defined __UCLIBC__) || _GLIBCXX_HAVE_LIBINTL_H
> #  include <libintl.h>
> # endif
> #endif

You're right, thanks for update on both.


Kind regards,
Petr
