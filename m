From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Aug 2016 16:36:16 +0200
Subject: [Buildroot] [PATCH 3/3] arch/arm: Add ARMV8 (aarch32) toolchain
 config.
In-Reply-To: <1471860748-5126-1-git-send-email-flatmax@flatmax.org>
References: <1471860748-5126-1-git-send-email-flatmax@flatmax.org>
Message-ID: <20160822163616.5fb14ccb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Aug 2016 20:12:28 +1000, Matt Flax wrote:

> @@ -174,8 +177,7 @@ config BR2_cortex_a53
>  	bool "cortex-A53"

It seems like this patch makes the assumption the previous Cortex-A53
patch has been applied.

Could you instead send a patch series that includes both patches
together. Don't *merge* the patches, just send them together in the
same series. It will also be less confusing than this standalone patch
labeled PATCH 3/3.

Also, I believe we need to merge arch/Config.in.aarch64 back into
arch/Config.in.arm in order to handle both 32 bits and 64 bits ARM
cores in the same Config.in.arm file, like we're doing for
Config.in.x86. Otherwise, we will end up duplicating all the ARM core
definitions for the 64 bits capable ones.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
