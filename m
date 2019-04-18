From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 18 Apr 2019 17:06:16 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH] linux-tools/perf: Add
 dependency on atomic ops for ARC
In-Reply-To: <20190418114115.2e186f18@windsurf>
References: <20190418093025.36642-1-abrodkin@synopsys.com>
 <20190418114115.2e186f18@windsurf>
Message-ID: <CY4PR1201MB0120AD583684DE9E67EA7C47A1260@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Thursday, April 18, 2019 12:41 PM
> To: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: buildroot at busybox.net; ARC Buildroot mailing list <arc-buildroot@synopsys.com>
> Subject: Re: [arc-buildroot] [Buildroot] [PATCH] linux-tools/perf: Add dependency on atomic ops for
> ARC
> 
> Hello,
> 
> On Thu, 18 Apr 2019 12:30:25 +0300
> Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:
> 
> > Atomic ops are strictly required by perf utility as it uses
> > atomic_xxx() functions.

[snip]
 
> Since the actual dependency is on sync builtins, can we use
> BR2_TOOLCHAIN_HAS_SYNC_4 instead ?
> 
> BR2_TOOLCHAIN_HAS_SYNC_4 is already defined like this:
> 
> config BR2_TOOLCHAIN_HAS_SYNC_4
>         bool
>         default y
>         depends on !BR2_m68k_cf
>         depends on !BR2_sparc
>         depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)

That looks much better in fact, so re-spin is coming.
Thanks for the hint!

-Alexey
