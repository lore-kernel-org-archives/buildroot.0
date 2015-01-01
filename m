From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 22:24:49 +0100
Subject: [Buildroot] [PATCH 2/7] linux: add option to rely on a
 bootloader-provided DTB
In-Reply-To: <e330f5c885f762feb6f4d7487fe3f6aa29c7fca3.1420142707.git.yann.morin.1998@free.fr>
References: <cover.1420142707.git.yann.morin.1998@free.fr>
 <e330f5c885f762feb6f4d7487fe3f6aa29c7fca3.1420142707.git.yann.morin.1998@free.fr>
Message-ID: <20150101222449.18453adb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  1 Jan 2015 21:23:48 +0100, Yann E. MORIN wrote:
> On some platforms (e.g. the Raspberry Pi), the DTB is already bundled
> with the bootloader, and installed with it. On some other platforms, the
> DTB might even be stored on the device itself (which is the ultimate
> goal of the DTB).
> 
> So far, when we build a kernel with DT support, we forcibly want a to
> also build the DTB blob, which goes against the situations described
> above.
> 
> Add a new option in the DT choice, to specify the DTB will be provided
> by the bootloader or the device itself.
> 
> This also means we must be a little bit more selective when we check the
> validity of the DTS name at build time.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I don't really see the point of this. If you don't want to build a DTB,
then don't tell Buildroot that you want to build a DTB, and that's it.
Why would we want such a patch?

Enabling CONFIG_OF should be done by the platform defconfig. It really
is tied to how the platform is supported in the Linux kernel, and is
not something that Buildroot should touch IMO.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
