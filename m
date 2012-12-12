From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Dec 2012 18:32:04 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <874njrnroe.fsf@dell.be.48ers.dk>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
 <20121211171008.3b869509@skate> <50C7D14F.4060304@mind.be>
 <20121212111628.5d1e9dba@skate> <20121212120159.4292d70b@skate>
 <20121212120341.69a89e93@skate> <20121212134703.7461d9c7@skate>
 <874njrnroe.fsf@dell.be.48ers.dk>
Message-ID: <20121212183204.718be669@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 12 Dec 2012 17:47:29 +0100, Peter Korsgaard wrote:

> Hmm, we already pass --disable-largefile to the gcc configure script,
> except for the first 2 passes. Does it work if we add
> $(DISABLE_LARGEFILE) to the gcc1 / gcc2 configure steps?

!largefile build is OK if we pass $(DISABLE_LARGEFILE) to gcc1 and gcc2
configure steps, so it solves the build problem. I haven't done more
testing though (testing the generated code, building with largefile
enabled, etc.).

That said, doesn't --disable-largefile disables largefile support at
the level of gcc itself, rather than taking into account the fact that
largefile support is not available on the target? Of course, it has the
consequence that _FILE_OFFSET_BITS is no longer defined to 64 in
auto-conf.h, which works around the problem. But gcc (the host
binary) should be capable of being built with largefile support on a 32
bits host, even if the 32 bits target has no largefile support.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
