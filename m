From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jun 2016 09:01:25 +0200
Subject: [Buildroot] [PATCH] erlang: enable compilation on mipsel
In-Reply-To: <1466527613-31459-1-git-send-email-fhunleth@troodon-software.com>
References: <1466527613-31459-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160622090125.727d9c7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Jun 2016 12:46:53 -0400, Frank Hunleth wrote:
> Erlang works fine on mipsel platforms so add it to the supported list.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> 
> As a side note, one would hope that Erlang would work fine on mips, mips64
> and mipsel64, but I haven't found documentation of this yet and I can't
> verify it myself on real hw.

We have very good Qemu defconfigs in Buildroot, for all of mips,
mipsel, mips64el and mips64:

$ ls -1 configs/qemu_mips*
configs/qemu_mips64el_malta_defconfig
configs/qemu_mips64_malta_defconfig
configs/qemu_mipsel_malta_defconfig
configs/qemu_mips_malta_defconfig

These allow to very easily test things on those architectures even when
hardware is not available.

Note that I'm not saying that you *have* to test Erlang on all those
architectures, I'm perfectly fine with enabling it on mipsel today, and
enabling it later on other architectures when people need that. I just
wanted to take this opportunity to mention the Qemu defconfigs, that
are very regularly maintained and updated by Gustavo.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
