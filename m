From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 28 Apr 2015 15:12:27 -0400
Subject: [Buildroot] rpi-firmware package installs DTBs that are kernel
 version specific
In-Reply-To: <553FA42F.8060602@je-eigen-domein.nl>
References: <553FA42F.8060602@je-eigen-domein.nl>
Message-ID: <CA+-urNRtZUyr-zscLFaVbfxWmEyLinTt+z9Z53kezbaREUpKLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Floris,

On Tue, Apr 28, 2015 at 11:15 AM, Floris Bos <bos@je-eigen-domein.nl> wrote:
>
> Hi,
>
> Currently the rpi-firmware buildroot package downloads and installs binary DTB files.
> Problem is that those DTB files seem to be kernel version specific, and the current ones only work properly with a rpi-3.18.y Linux kernel.
> When you use them with a kernel build from the rpi-3.19.y or rpi-4.0.y branch mmc0 does not function.

That makes sense. Thanks for posting why mmc0 doesn't function, since
I was seeing the same issue.

> Think it may be better if we remove the binary DTB file installation from the rpi-firmware package, forcing the user to compile the device tree files from kernel source instead, ensuring matching version.

I'm actually not sure of the benefit of the rpi-3.19.y or later
kernels due to the regular upstream rebasing of the repositories. It
sounds like this is yet another downside, and I'll send a patch
tomorrow to change the RPI2 to rpi-3.18.y barring new information or
someone beating me to it. That way the 2015.05 release will at least
work out of the box for the RPI2.

I'm with you on building the DTBs in principle. I never felt like I
was forced to use the DTBs that were copied to output/images by
rpi-firmware, but at a minimum, it would be nice if they weren't
copied over if you weren't using a compatible kernel.

Regards,
Frank
