From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 2 Feb 2015 21:40:33 +0100
Subject: [Buildroot] [PATCH 3/3] docs/manual/beyond-buildroot: building
 and testing live-CDs
In-Reply-To: <1421697177-12995-3-git-send-email-nrubinstein@aldebaran.com>
References: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
 <1421697177-12995-3-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <CAAXf6LXmBA3=F9qK-rToTNr_EjgwMaygEhE9=P9sQqHqnuwZ_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi No?,

On Mon, Jan 19, 2015 at 8:52 PM, No? Rubinstein
<nrubinstein@aldebaran.com> wrote:
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
> ---
>  docs/manual/beyond-buildroot.txt | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
> index b8b1973..d5d7089 100644
> --- a/docs/manual/beyond-buildroot.txt
> +++ b/docs/manual/beyond-buildroot.txt
> @@ -35,3 +35,29 @@ you should be aware of:
>
>  * Buildroot does not currently provide +host-qemu+ and +binfmt+
>    correctly built and set for that kind of use.
> +
> +==== Live-CD
> +
> +To build a live-CD image, enable _iso image_ in the _Filesystem images_ menu.
> +(This works only on x86 and x86_64.)
> +
> +You can build a live-CD image with either ISOLINUX or Grub as a bootloader,
> +but only ISOLINUX supports using this image with a live-USB drive.
> +
> +You can test your live-CD image using QEMU:
> +
> +-------------------
> +qemu-system-i386 -cdrom output/images/rootfs.iso9660
> +-------------------
> +
> +Or use it as a hard-drive image if it is an hybrid ISO:

an hybrid --> a hybrid

> +
> +-------------------
> +qemu-system-i386 -hda output/images/rootfs.iso9660
> +-------------------
> +
> +It can be easily flashed to an USB drive with +dd+:

an USB --> a USB


Best regards,
Thomas
