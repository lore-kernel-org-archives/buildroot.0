From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 19:53:22 +0200
Subject: [Buildroot] [PATCH 18/27] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_63261
In-Reply-To: <20190614210346.121013-19-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-19-giulio.benetti@micronovasrl.com>
Message-ID: <20190622195322.47a8c59f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:37 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> GCC hangs while building fxload for the Microblaze Arch using following

So gcc does not "hang", but there is a build failure, which is a bit
different.

I applied this patch as well as 19/27 (fxload) and 20/27 (dmalloc).

However, could you double check if the issue occurs with just
optimization enabled, or only when optimization *and*
BR2_ENABLE_DEBUG=y are enabled?

Indeed, my original gcc bug report said that the problem only occurred
when both are combined.

I applied anyway, because that debugging thing would simply be a
further refinement, so it's not that important.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
