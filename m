From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed, 29 Apr 2015 17:21:05 +0200
Subject: [Buildroot] rpi-firmware package installs DTBs that are kernel
 version specific
In-Reply-To: <CA+-urNRtZUyr-zscLFaVbfxWmEyLinTt+z9Z53kezbaREUpKLw@mail.gmail.com>
References: <553FA42F.8060602@je-eigen-domein.nl>
 <CA+-urNRtZUyr-zscLFaVbfxWmEyLinTt+z9Z53kezbaREUpKLw@mail.gmail.com>
Message-ID: <5540F6E1.60903@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 04/28/2015 09:12 PM, Frank Hunleth wrote:
> I'm actually not sure of the benefit of the rpi-3.19.y or later
> kernels due to the regular upstream rebasing of the repositories. It
> sounds like this is yet another downside, and I'll send a patch
> tomorrow to change the RPI2 to rpi-3.18.y barring new information or
> someone beating me to it. That way the 2015.05 release will at least
> work out of the box for the RPI2.

Yes, I think 3.18 is fine as default.
Although there may still be users that have a need for a later release, 
e.g. if they have a brand new USB device that is only properly supported 
in a later release.

> I'm with you on building the DTBs in principle. I never felt like I
> was forced to use the DTBs that were copied to output/images by
> rpi-firmware, but at a minimum, it would be nice if they weren't
> copied over if you weren't using a compatible kernel.

Technically the files are not copied over as the rpi-firmware dtb ends 
up in output/images/rpi-firmware and if you specify 
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b" the kernel compiled 
one ends up in output/images
But it is still a bit confusing to have two dtbs under output/images
Might be cleaner to just reintroduce the -recently removed- 
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS option, so at least copying the 
rpi-firmware ones can be disabled.


Yours sincerely,

Floris Bos
