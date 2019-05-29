From: Thomas Huth <huth@tuxfamily.org>
Date: Wed, 29 May 2019 10:50:46 +0200
Subject: [Buildroot] libftdi1 licenses
In-Reply-To: <CAGm1_ktUkdhxROJMqgO5UHaOFf7dmaj2rYVvruOTjay5C8XLnA@mail.gmail.com>
References: <CAGm1_ktUkdhxROJMqgO5UHaOFf7dmaj2rYVvruOTjay5C8XLnA@mail.gmail.com>
Message-ID: <20190529105046.62ab50f7@thl530.multi.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 29 May 2019 09:40:52 +0200
schrieb Yegor Yefremov <yegorslists@googlemail.com>:

> FOSSology scan reveals that src/ftdi_stream.c contains MIT license.
> 
> Some CMake scripts are licensed under LGPL 2.1
> (cmake/UseLibFTDI1.cmake). Should this also be mentioned?

It's obviously not only the cmake files that contain LGPL 2.1 code, but
also some .c files:

$ grep -r Lesser */*.c
src/ftdi.c: *   it under the terms of the GNU Lesser General Public License           *
src/ftdi_stream.c: *   it under the terms of the GNU Lesser General Public License           *

... so IMHO yes, this should be mentioned.

Even better: Get in touch with the libfdtdi1 folks and ask them to fix
their license information (i.e. either use "Library GPL" in the .c
files or update the LICENSE and COPYING.LIB files to "Lesser GPL").

 Thomas H
