From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 24 Sep 2014 15:47:45 +0200
Subject: [Buildroot] [PATCH 2/2] freescale/imx6-sabresd: use up-to-date
 mainline Linux
In-Reply-To: <5422BB4B.7050703@freescale.com>
References: <1411560193-9697-1-git-send-email-luca@lucaceresoli.net>
 <1411560193-9697-3-git-send-email-luca@lucaceresoli.net>
 <5422BB4B.7050703@freescale.com>
Message-ID: <5422CB81.6020905@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent,

Vincent Stehl? wrote:
> On 09/24/2014 02:03 PM, Luca Ceresoli wrote:
>> Move to mainline Linux and upgrade the kernel version to the same version
>> used for the toolchain kernel headers.
>
> Hi Luca,
>
> I am not sure if abandoning the Freescale release kernel is the best
> option for i.MX6. Indeed, if you want e.g. proper video
> (package/freescale-imx/imx-vpu) and 3D
> (package/freescale-imx/gpu-viv-bin-mx6q) support to still work as
> expected you need to stay with the 3.10.17.
>
> Wouldn't you prefer to align the headers instead?

I'm not sure what's the best way either.

As per discussion with Thomas, using mainline kernel is preferred, and I
tend to agree, probably because I've had some bad experiences with
other vendor's kernels in the past.

Still, having good hardware support is important of course, and I
probably will use Freescale's kernel in real products, not mainline,
for this reason.

The vendor kernel argument would be stronger for Buildroot if we could
point our users to some docs or examples that allow them to notice the
features working with the vendor kernel and not in mainline.
Something that allows a user to:
   1. build a defconfig for the board
   2. run the final rootfs on the board
   3. test the video or 3D accelerator (that doesn't work with mainline)

Anything on your blog, maybe?

Aah, this leads me to think again about the "demo defconfigs" (as
opposed to minimal defconfigs) that we spoke about in the past... but
this is getting quite OT probably.

Oh, look! Peter just committed a change to nitrogen6x_defconfig where
he's locking kernel headers to 3.10.17 to match the kernel. And guess
what, the kernel is not mainline (although it's from Boundary Devices,
not got.freescale.com, but that doesn't matter much).
Here it is: 
http://git.buildroot.org/buildroot/commit/?id=2b8937f238a3593c9267a68e0fdad83841a56657

-- 
Luca
