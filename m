From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 20:50:49 +0100
Subject: [Buildroot] [PATCH] elfutils: fix sparc64 build, -fPIC required
In-Reply-To: <20151103181810.GE21428@waldemar-brodkorb.de>
References: <20151103171832.GA7668@waldemar-brodkorb.de>
 <20151103185733.364482c2@free-electrons.com>
 <20151103181810.GE21428@waldemar-brodkorb.de>
Message-ID: <20151103205049.0de46109@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Tue, 3 Nov 2015 19:18:10 +0100, Waldemar Brodkorb wrote:

> > I don't like the duplication of the _FILE_OFFSET_BITS dance. Can you
> > introduce an ELFUTILS_CFLAGS instead ?
> 
> Okay, I did know you wouldn't like it ;)

So why didn't you fix in the first iteration ? :-)

> > Also, for libpcap, -fPIC is needed instead of -fpic for both microblaze
> > and sparc64. But for elfutils, -fPIC is only needed for sparc64 ? I
> > just tested a quick build of elfutils on microblaze, and it indeed
> > works without any change.
> > 
> > Do you have any clue why?
> 
> No idea, sorry.

In fact, libpcap builds just fine with -fPIC on Microblaze with the
Buildroot toolchain. Maybe it was an issue with a specific toolchain a
while ago.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
