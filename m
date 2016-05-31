From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 23:28:02 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.15
In-Reply-To: <20160529102615.GA6824@waldemar-brodkorb.de>
References: <20160529102615.GA6824@waldemar-brodkorb.de>
Message-ID: <20160531232802.581b9f05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 May 2016 12:26:15 +0200, Waldemar Brodkorb wrote:
> The Linuxthreads support got reorganized.
> LT.new is removed, LT.old is the default for
> Linuxthreads.

Cool! Finally some cleanup in this area.

> -	config BR2_PTHREADS_OLD
> -		bool "linuxthreads (stable/old)"
> -		select BR2_TOOLCHAIN_HAS_THREADS

Since you're removing this option, we need Config.in.legacy handling
for it.

In the long term, I believe we should probably remove this choice
completely, and simply use NPTL on all platforms where it is available,
and automatically use linuxthreads on platforms where NPTL is not
available. I really don't see the point of not using NPTL when it's
available.

But that's for a separate patch.

The rest of your patch looks good, so please resubmit with just the
Config.in.legacy handling added.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
