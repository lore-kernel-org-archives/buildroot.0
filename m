From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jul 2013 17:03:19 +0200
Subject: [Buildroot] How to rebuild root filesystem?
In-Reply-To: <20130708141210.GA11258@zuhnb712>
References: <20130708045657.GA29211@zuhnb712.ap.bm.net>
 <20130708102732.46a8b87d@skate> <20130708141210.GA11258@zuhnb712>
Message-ID: <20130708170319.5e53eab8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Mon, 8 Jul 2013 22:12:10 +0800, Woody Wu wrote:

> okay, may be it tooks too long time to make me think it was building the
> toolchain, maybe it was just building the kernel. Whatever.
> 
> When I said external toolchain, I actually's talking about Code Sourery
> which can be selected from buildroot toolchain configuration menu. Maybe
> she's now so external.

If you're using the Sourcery CodeBench toolchain (formerly known as
CodeSourcery toolchains), then you are using an external toolchain, and
the toolchain never gets rebuilt.

> Anyway, for my real question, is there a solution? How to reuild the
> root filesystem from scratch.  Thanks!

The only safe solution is "make clean && make". Any other solution
risks of giving you an inconsistent filesystem in terms of library
dependencies.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
