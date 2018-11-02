From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 2 Nov 2018 16:23:37 +0530
Subject: [Buildroot] Queries/suggestions regarding patch series "grub2:
 add support for arm and aarch64"
In-Reply-To: <20181102110420.0f4f44f1@windsurf>
References: <CAFA6WYP2bTxdkAKUem_O9GtPdt_hi4Hbg59XiWwEfNvLoc8ghQ@mail.gmail.com>
 <CAK4VdL0+P6HLVcTb21ECatLwBb0jPQ2sVOYtMNCUiLyw44Z5-w@mail.gmail.com>
 <20181102110420.0f4f44f1@windsurf>
Message-ID: <CAFA6WYPKMzjuCv1hFyByOTg_7vGKytWO3OZf4La21VyuF8CffQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2 Nov 2018 at 15:34, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue, 30 Oct 2018 20:23:27 +0100, Erico Nunes wrote:
>
> > Using PARTUUID seems to be an interesting change. I'd like to hear the
> > opinion of the other Buildroot developers before making this change in
> > this patchset though, since most other platforms in Buildroot are not
> > doing this.
>
> It is certainly a good idea to use PARTUUID when possible.
>
> > If there is interest in it, maybe we can do this change for other
> > platforms too and in a separate patchset?
>
> In general yes. However, my understanding was that it works only with a
> GPT partition table, because only the GPT partition table can embed a
> unique identifier per partition, not the old MBR partition table. But
> apparently this disk-signature thing allows to embed a disk-wide
> identifier, not a per-partition one, so it works only when there's a
> single partition ?
>

Yes disk-signature is disk-wide identifier. But it could work with
multiple partitions in following manner:

Like the change, I have proposed with disk-signature = 0xDEEDBEEF,
PARTUUID=deedbeef-02 refers to 2nd partition in disk with
corresponding signature.

AFAIK, I don't think partitioning format changes for a particular
device boot sequence if underlying disk changes (usb, sata, mmc etc.).
So "-02" string should remain a constant.

Regards,
Sumit

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
