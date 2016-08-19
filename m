From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 10:03:20 +0200
Subject: [Buildroot] [PATCH 1/1] arch/arm: Add Cortex-a53 CPU
In-Reply-To: <1471565224-15625-1-git-send-email-flatmax@flatmax.org>
References: <1471565224-15625-1-git-send-email-flatmax@flatmax.org>
Message-ID: <20160819100320.1d2609bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 10:07:04 +1000, Matt Flax wrote:
> Adds the Cortex-a53 CPU to the target architecture variant choice. This sets
> the toolchain to use cortex-a53 as the target. The effect is that various
> cortex-a53 tunings are enabled for the compilation of packages.
> 
> Signed-off-by: Matt Flax <flatmax@flatmax.org>

The A53 is an ARM64 CPU, so it should rather be added to
Config.in.aarch64 (in which we don't yet have a CPU selection, but that
can be added).

Or are you building a 32 bits ARM system for a Cortex-A53 ? In that
case, adding it to Config.in.arm would be OK, but it's a bit annoying
that we would have to duplicate many ARM CPUs between Config.in.arm and
Config.in.aarch64.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
