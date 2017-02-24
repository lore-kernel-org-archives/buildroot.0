From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Feb 2017 15:48:57 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <c5d029d5-f610-6709-852a-b84c7ad6313d@free.fr>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
 <c5d029d5-f610-6709-852a-b84c7ad6313d@free.fr>
Message-ID: <20170224154857.61f03dfd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Feb 2017 15:37:00 +0100, Julien Boibessot wrote:

> > Static linking issue. Julien B.?  
> 
> It seems that adding "-static" to final linking command solves the
> problem. It's strange that other static builds on other ARCH are working ?

Waldemar can answer this question I believe.

> Should I add a ~ "LDGLAGS += -static" in opentyrian.mk ?

-static is already in TARGET_LDFLAGS, so the problem is that you are
not passing TARGET_LDFLAGS properly. You should do:

	LDFLAGS="$(TARGET_LDFLAGS) -lm"

instead of just:

	LDFLAGS="-lm"

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
