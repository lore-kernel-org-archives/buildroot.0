From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Nov 2020 18:02:26 +0100
Subject: [Buildroot] [PATCH 03/10] package/pkg-generic.mk: add CPE ID
 related package variables
In-Reply-To: <CANQCQpbD8L4uOp9KCExwGcD4EPi8HGJatrqyqEV8_Ccd1=4x5w@mail.gmail.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-4-thomas.petazzoni@bootlin.com>
 <CANQCQpbD8L4uOp9KCExwGcD4EPi8HGJatrqyqEV8_Ccd1=4x5w@mail.gmail.com>
Message-ID: <20201105180226.50270453@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 4 Nov 2020 11:03:04 -0600
Matthew Weber <matthew.weber@rockwellcollins.com> wrote:

> > If any of the <pkg>_CPE_ID_{VENDOR,PRODUCT,...} variables are defined
> > by the package, then <pkg>_CPE_ID_VALID = YES will be set by the
> > generic package infrastructure.  
> 
> Oh good call, so we don't need to explicitly set the VALID if we've
> already tailored it.

That is the idea.

The only thing I am not fully happy with is that a package can't set
directly <pkg>_CPE_ID, only the infrastructure can do that. I couldn't
figure out a reasonable way to allow a package to set <pkg>_CPE_ID
while still keeping the generic-package code simple enough *and* match
the other constraints that we have.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
