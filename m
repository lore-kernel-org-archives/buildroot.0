From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Oct 2018 10:36:37 +0200
Subject: [Buildroot] [RFC PATCH 1/1] libffi: v3.2.1 doesn't support
 riscv targets yet
In-Reply-To: <81a2a99d-9d72-7821-e7c1-9a09d76d77e5@mind.be>
References: <20181023214409.6818-1-ferdinand@ombud.nl>
 <81a2a99d-9d72-7821-e7c1-9a09d76d77e5@mind.be>
Message-ID: <20181024103637.487f6190@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Mark Corbin in Cc.

On Wed, 24 Oct 2018 01:24:09 +0100, Arnout Vandecappelle wrote:

> > The upcoming version 3.3.0 will support riscv [1], so this patch would
> > be temporary. Do we wait for that release, or should we explicitly
> > disable libffi for riscv in the meantime?
> > 
> > [1] https://github.com/libffi/libffi/commit/3840d49aaa831d649b1597518a2903dfed0d57f3  

FYI, we already discussed the libffi/RISC-V situation during the
Buildroot meeting last week end with Mark Corbin (who added the RISC-V
64 support). And I think he was working on backporting the RISC-V
libffi support so that we can add it as a patch in Buildroot.

That being said...

>  Personally, I would be fine with doing this gradually, i.e. it is not needed to
> fix all 150 packages in a single commit. Indeed, the build is already broken
> anyway, so if this is shown as a circular dependency warning or as a build
> failure of libffi doesn't matter that much.

... I am indeed not opposed to fixing properly the libffi arch
dependencies. It is true that with the autobuilders in place, we can do
this gradually. It would be cleaner than the magic exception we have in
the autobuilder script. The downside is that we will have for a fairly
long time a significant number of autobuilder failures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
