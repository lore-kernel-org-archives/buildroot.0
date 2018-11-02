From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 11:04:20 +0100
Subject: [Buildroot] Queries/suggestions regarding patch series "grub2:
 add support for arm and aarch64"
In-Reply-To: <CAK4VdL0+P6HLVcTb21ECatLwBb0jPQ2sVOYtMNCUiLyw44Z5-w@mail.gmail.com>
References: <CAFA6WYP2bTxdkAKUem_O9GtPdt_hi4Hbg59XiWwEfNvLoc8ghQ@mail.gmail.com>
 <CAK4VdL0+P6HLVcTb21ECatLwBb0jPQ2sVOYtMNCUiLyw44Z5-w@mail.gmail.com>
Message-ID: <20181102110420.0f4f44f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Oct 2018 20:23:27 +0100, Erico Nunes wrote:

> Using PARTUUID seems to be an interesting change. I'd like to hear the
> opinion of the other Buildroot developers before making this change in
> this patchset though, since most other platforms in Buildroot are not
> doing this.

It is certainly a good idea to use PARTUUID when possible.

> If there is interest in it, maybe we can do this change for other
> platforms too and in a separate patchset?

In general yes. However, my understanding was that it works only with a
GPT partition table, because only the GPT partition table can embed a
unique identifier per partition, not the old MBR partition table. But
apparently this disk-signature thing allows to embed a disk-wide
identifier, not a per-partition one, so it works only when there's a
single partition ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
