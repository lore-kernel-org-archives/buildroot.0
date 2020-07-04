From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jul 2020 23:01:36 +0200
Subject: [Buildroot] [PATCH] qemu_aarch64_virt: use the in-kernel
 defconfig
In-Reply-To: <affa122f-ca38-e1f8-7bba-79ece4e87024@gmail.com>
References: <20200704141802.1586504-1-masahiroy@kernel.org>
 <affa122f-ca38-e1f8-7bba-79ece4e87024@gmail.com>
Message-ID: <20200704230136.086e2263@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 4 Jul 2020 17:41:39 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Hi Masahiro,
> 
> Le 04/07/2020 ? 16:18, Masahiro Yamada a ?crit?:
> > The defconfig file from the kernel tree works enough for the
> > qemu-system-aarch64 virt machine. Remove the custom config file.  
> 
> I'm agree that we should use the architecture's default configuration when
> possible and use a defconfig fragment to enable (or disable) additional options.
> 
> Note: The default defconfig contain more option enabled that the defconfig
> provided by Buildroot. The kernel build time is slightly increased.
> 
> Can you compare the diff between the two defconfig ?
> If some options enabled in the custom linux.conf but not in the architecture's
> default configuration, we need to consider adding them in a defconfig fragment file.

The arm64 defconfig is really huge, as it builds supports for all arm64
platforms. I think it makes sense to have a smaller defconfig that
builds a kernel just for the Qemu AArch64 virt platform.

More than a diff between the two configs, I'd be more interested in
having details on the build time of both (and perhaps the resulting
kernel image size).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
