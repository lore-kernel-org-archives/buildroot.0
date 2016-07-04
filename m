From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 00:13:45 +0200
Subject: [Buildroot] [PATCH 1/6] gnutls: update legal info
In-Reply-To: <20160704153950.GB3549@free.fr>
References: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20160704153950.GB3549@free.fr>
Message-ID: <20160705001345.3cbcd8b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jul 2016 17:39:50 +0200, Yann E. MORIN wrote:

> On 2016-07-04 18:16 +0530, Rahul Bedarkar spake thusly:
> > GnuTLS core library is licensed under LGPLv2.1+ while gnutls-openssl
> > library is licensed under GPLv3+. Annotate the license with components.  
> 
> What do you call "core library" and "gnutls-openssl library"?

This is explained in the README file:

"""
Since GnuTLS version 3.1.10, the core library has been released under
the GNU Lesser General Public License (LGPL) version 2.1 or later.

Note, however, that version 6.0.0 and later of the gmplib library used
by GnuTLS are distributed under a LGPLv3+ or GPLv2+ dual license, and
as such binaries of this library need to adhere to either LGPLv3+ or
GPLv2+ license.

The GNU LGPL applies to the main GnuTLS library, while the
included applications as well as gnutls-openssl 
library are under the GNU GPL version 3.  The gnutls library is 
located in the lib/ and libdane/ directories, while the applications
in src/ and, the gnutls-openssl library is at extra/.
"""

> 
> Do you consider libdane to be that "gnutls-openssl library" you talk
> about?

No, see above. libdane is part of the "core library".

> I've looked at the source, and libdane is (at least partially) LGPLv3:
> 
>     libdane/errors.c:
>     [--SNIP--]
>      * libdane is free software; you can redistribute it and/or
>      * modify it under the terms of the GNU Lesser General Public License
>      * as published by the Free Software Foundation; either version 3 of
>      * the License, or (at your option) any later version.
>     [--SNIP--]

This seems to be a bug, which I've reported upstream at
https://gitlab.com/gnutls/gnutls/issues/109.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
