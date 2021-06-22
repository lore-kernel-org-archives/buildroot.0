From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Jun 2021 11:34:06 +0200
Subject: [Buildroot] [PATCH 03/15] package/pkg-generic.mk: Remove Info
 documents dir entry
In-Reply-To: <20210622104343.0c5ea063@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-4-herve.codina@bootlin.com>
 <20210621225120.536cd758@windsurf>
 <20210622104343.0c5ea063@bootlin.com>
Message-ID: <20210622113406.11234e26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Jun 2021 10:43:43 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> > However, I'm not a huge fan of having this right in the middle of the
> > infrastructure. It feels like a small detail that gets handled in the
> > middle of super generic infrastructure code.
> > 
> > The issue is that I don't really have a good alternative proposal :-/  
> 
> Maybe using a macro defined closed to fixup-libtool-files and calling
> this macro here instead of '$(Q)rm ...' will help.
> Do you think it will be better ?

Either a macro, or a list of files that are removed, perhaps?

> This add a little complexity in overwrite detection (filter out) and
> I prefer having overwrite detection quite stupid. It checks for
> overwrites without any exception.
> Adding exception now in the detection mechanism is opening the door to
> more and more exceptions.

Yes, I understand your argument. As I stated: I'm also not sure which
solution to propose here. I was just not a big fan of this removal of
one specific file, there, in the middle of a highly generic piece of
infrastructure.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
