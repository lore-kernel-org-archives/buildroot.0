From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 12:00:42 +0100
Subject: [Buildroot] Queries/suggestions regarding patch series "grub2:
 add support for arm and aarch64"
In-Reply-To: <CAFA6WYPKMzjuCv1hFyByOTg_7vGKytWO3OZf4La21VyuF8CffQ@mail.gmail.com>
References: <CAFA6WYP2bTxdkAKUem_O9GtPdt_hi4Hbg59XiWwEfNvLoc8ghQ@mail.gmail.com>
 <CAK4VdL0+P6HLVcTb21ECatLwBb0jPQ2sVOYtMNCUiLyw44Z5-w@mail.gmail.com>
 <20181102110420.0f4f44f1@windsurf>
 <CAFA6WYPKMzjuCv1hFyByOTg_7vGKytWO3OZf4La21VyuF8CffQ@mail.gmail.com>
Message-ID: <20181102120042.060a3451@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sumit,

On Fri, 2 Nov 2018 16:23:37 +0530, Sumit Garg wrote:

> Yes disk-signature is disk-wide identifier. But it could work with
> multiple partitions in following manner:
> 
> Like the change, I have proposed with disk-signature = 0xDEEDBEEF,
> PARTUUID=deedbeef-02 refers to 2nd partition in disk with
> corresponding signature.

Aaah, yes, I had entirely missed the -02 part in the root=PARTUUID=
statement. Indeed, it's a lot clearer now how this can work.

> AFAIK, I don't think partitioning format changes for a particular
> device boot sequence if underlying disk changes (usb, sata, mmc etc.).
> So "-02" string should remain a constant.

Yes, absolutely! Thanks for the additional explanation!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
