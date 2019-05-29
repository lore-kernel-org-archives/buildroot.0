From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 May 2019 00:09:00 +0200
Subject: [Buildroot] libftdi1 licenses
In-Reply-To: <20190529105046.62ab50f7@thl530.multi.box>
References: <CAGm1_ktUkdhxROJMqgO5UHaOFf7dmaj2rYVvruOTjay5C8XLnA@mail.gmail.com>
 <20190529105046.62ab50f7@thl530.multi.box>
Message-ID: <285099f2-a48c-4cfa-2783-e6bca62558f4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/05/2019 10:50, Thomas Huth wrote:
> Am Wed, 29 May 2019 09:40:52 +0200
> schrieb Yegor Yefremov <yegorslists@googlemail.com>:
> 
>> FOSSology scan reveals that src/ftdi_stream.c contains MIT license.

 Hard to be sure... It is "adapted from" a MIT-licensed file. If the original
author has agreed, it may just have been relicensed to LGPL-2.1.

 So, as Thomas suggests: better ask upstream.

>>
>> Some CMake scripts are licensed under LGPL 2.1
>> (cmake/UseLibFTDI1.cmake). Should this also be mentioned?

 No, we don't take into account the files used during build, only what ends up
on the target. Well, give or take :-). Otherwise, every autotools package would
also have to mention GPL for config.guess and config.sub (and usually more).


> It's obviously not only the cmake files that contain LGPL 2.1 code, but
> also some .c files:
> 
> $ grep -r Lesser */*.c
> src/ftdi.c: *   it under the terms of the GNU Lesser General Public License           *
> src/ftdi_stream.c: *   it under the terms of the GNU Lesser General Public License           *

 In fact, it looks like it is *all* licensed under LGPL-2.1 now. The COPYING.LIB
file, however, has not been updated...


> ... so IMHO yes, this should be mentioned.
> 
> Even better: Get in touch with the libfdtdi1 folks and ask them to fix
> their license information (i.e. either use "Library GPL" in the .c
> files or update the LICENSE and COPYING.LIB files to "Lesser GPL").

 +1 to that.

 There's another bug in Buildroot's license info: the GPL exception for ftdipp1
is not mentioned.

 Regards,
 Arnout
