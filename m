From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 14:04:33 +0200
Subject: [Buildroot] libfslcodecs libraries installation location
In-Reply-To: <CAAMH-ytR6pzKajyZ_KhL8jR7dsFqLN-oK2+BEJr5yYZeP2TPHw@mail.gmail.com>
References: <20150712215125.4675bd5f@free-electrons.com>
 <CAAMH-yuiKwzK1_q0hwxC3SigU+veYQA3wQTiZRdGYO0j=K=Z5g@mail.gmail.com>
 <20150713100336.0de992c5@free-electrons.com>
 <CAAMH-ytR6pzKajyZ_KhL8jR7dsFqLN-oK2+BEJr5yYZeP2TPHw@mail.gmail.com>
Message-ID: <20150727140433.286c0e60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Mon, 27 Jul 2015 13:35:00 +0200, Gary Bisson wrote:

> For the audio plugins above, it requires to add
> /usr/lib/imx-mm/audio-codec/ to LD_LIBRARY_PATH. Funny thing is that
> all the other libs (video-codec) do not seem to be used.

Ok, thanks for testing!

> I'd use Jerome approach (ld.so.conf) instead of copying the libraries
> to another path.

Unfortunately, I wanted to remove completely the ld.so.conf/ldconfig
logic. Having a ldconfig that works in a cross-compilation mode to
generate the ld.so.cache at build time is complicated and not supported
by upstream glibc.

And ld.so.conf is not used by the dynamic linker itself as far as I
understood, it's only used by ldconfig to build ld.so.cache.

So my plan was to get rid completely of ld.so.conf and the bogus call
to ldconfig in the main Buildroot Makefile, and simply make sure that
all libraries are either in /lib or /usr/lib.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
