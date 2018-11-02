From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 2 Nov 2018 14:10:15 +0100
Subject: [Buildroot] Queries/suggestions regarding patch series "grub2:
 add support for arm and aarch64"
In-Reply-To: <20181102120042.060a3451@windsurf>
References: <CAFA6WYP2bTxdkAKUem_O9GtPdt_hi4Hbg59XiWwEfNvLoc8ghQ@mail.gmail.com>
 <CAK4VdL0+P6HLVcTb21ECatLwBb0jPQ2sVOYtMNCUiLyw44Z5-w@mail.gmail.com>
 <20181102110420.0f4f44f1@windsurf>
 <CAFA6WYPKMzjuCv1hFyByOTg_7vGKytWO3OZf4La21VyuF8CffQ@mail.gmail.com>
 <20181102120042.060a3451@windsurf>
Message-ID: <CAK4VdL0yHwb-hJpL8ofyaXcwqHW52BH7KxYVAtmmawJVKg5XNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 2, 2018 at 12:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Sumit,
>
> On Fri, 2 Nov 2018 16:23:37 +0530, Sumit Garg wrote:
>
> > Yes disk-signature is disk-wide identifier. But it could work with
> > multiple partitions in following manner:
> >
> > Like the change, I have proposed with disk-signature = 0xDEEDBEEF,
> > PARTUUID=deedbeef-02 refers to 2nd partition in disk with
> > corresponding signature.
>
> Aaah, yes, I had entirely missed the -02 part in the root=PARTUUID=
> statement. Indeed, it's a lot clearer now how this can work.
>
> > AFAIK, I don't think partitioning format changes for a particular
> > device boot sequence if underlying disk changes (usb, sata, mmc etc.).
> > So "-02" string should remain a constant.
>
> Yes, absolutely! Thanks for the additional explanation!

That looks nice indeed.

So I propose that if I need to respin the grub2 arm series, I will
incorporate the PARTUUID change. Otherwise, I can later send a
separate patchset changing it for aarch64_efi and the pc_* defconfigs.

Erico
