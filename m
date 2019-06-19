From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 07:24:15 +0200
Subject: [Buildroot] [PATCH 01/27] package/keyutils: re-enable package
 on microblaze
In-Reply-To: <20190614210346.121013-2-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-2-giulio.benetti@micronovasrl.com>
Message-ID: <20190619072415.39f773fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:20 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> keyutils has a !BR2_microblaze introduced by commit:
> https://git.buildroot.net/buildroot/commit/?id=20e0926f4469a3486629cfd6fa7f449f2b659aa8
> that points 2 possible build failures:
> - "warning: dereferencing type-punned pointer will break strict-aliasing
>   rules" treated as an error. But this warning is not treated as an
>   error anymore since -Werror flag is not used after last version bumps
> - glibc does not export the resolver symbols resulting in linking
>   failure. But glibc used was version 2.3.6 that is not used anymore
>   since. It's been released in 2005.
> 
> So re-enable package for Microblaze by removing 'depends on
> !BR2_microblaze' from keyutils Config.in
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/keyutils/Config.in | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
