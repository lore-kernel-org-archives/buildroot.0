From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 16 Jul 2019 17:45:49 +0530
Subject: [Buildroot] [PATCH 2/2] fs/cpio: make cpio rootfs reproducible
In-Reply-To: <20190714172133.GC29941@scaer>
References: <20190714162335.12684-1-itsatharva@gmail.com>
 <20190714164725.GB29941@scaer> <20190714172133.GC29941@scaer>
Message-ID: <40090178.cAxkiHm8M1@msi-manjaro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all:

Replying to both of Yann's emails in this one:

On Sunday, July 14, 2019 10:17:25 PM IST Yann E. MORIN wrote:
> Having a pure assignment in a condition is risky for the future. If we
> were to later add new unconditional options, we would add them before
> this part (as is customary to do: uncoditional stuff goes before
> conditional stuff). In this case, the assignment here would override the
> uncoditional options, which is not nice.
> 
> Instead, I think we prefer an append-assignment in conditional blocks,
> even if the variable is not already defined.

Ah yes that makes sense. I'll change it to an append-assignment in v2.
Thanks!

On Sunday, July 14, 2019 10:51:33 PM IST Yann E. MORIN wrote:
> Atharva, All,
> 
> On 2019-07-14 18:47 +0200, Yann E. MORIN spake thusly:
> > On 2019-07-14 21:53 +0530, Atharva Lele spake thusly:
> > > Pass the recommended argument in the CPIO manual to make cpio archives
> > > reproducible.
> 
> [--SNIP--]
> 
> > > +# --repoducible option was not introduced until cpio v2.12. Some
> > > distros
> > > +# like Ubuntu 16.04 or Debian oldstable which package v2.11. Hence
> > > build
> > > +# host-cpio.
> > > +ifeq ($(BR2_REPRODUCIBLE), y)
> > > +ROOTFS_CPIO_DEPENDENCIES += host-cpio
> > > +CPIO_OPTS = --reproducible
> 
> In addition to my previous comments: the variable shall be prefixed with
> ROOTFS_CPIO_, not just with CPIO_, otherwise it could clash with variables
> from the cpio package itself.

Agreed, fixing it in v2.

> Regards,
> Yann E. MORIN.

Thanks for the review!

Regards,
Atharva Lele
