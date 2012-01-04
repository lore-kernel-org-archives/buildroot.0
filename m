From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Jan 2012 13:39:03 +0100
Subject: [Buildroot] [PATCH 1/2] lpc32xx: Add CDL to the available
 bootloaders
In-Reply-To: <1325675997.2442.25.camel@emblysd024.adetel.com>
References: <1325616568-17471-1-git-send-email-abelloni@adeneo-embedded.com>
 <1325616568-17471-2-git-send-email-abelloni@adeneo-embedded.com>
 <20120103210841.7a5ff77a@skate>
 <1325675997.2442.25.camel@emblysd024.adetel.com>
Message-ID: <20120104133903.6a7edf69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 04 Jan 2012 12:19:57 +0100,
Alexandre Belloni <abelloni@adeneo-embedded.com> a ?crit :

> It won't compile without it because the files are duplicate, the linker
> will complain about symbols being defined twice. I definitely tried to
> keep the patch as small as possible.

Ok.

> Th fact is that they are already duplicated in the original source. Is
> it worth patching the makefiles to unify those ?
> 
> Upstream is trying to unify everything. I hope t will be done at some
> point in time.

Ok. Then I'm fine with those.

> Will be done but $(MAKE) won't work as it isn't possible to compile
> using multiple jobs. Is it worth fixing the makefiles for a so small
> piece of code ?

Then specify:

LPC32XXCDL_MAKE = $(MAKE1)

And Buildroot will use make -j1 to build this package specifically. See
package/at/at.mk for an example.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
