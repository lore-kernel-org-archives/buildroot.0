From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 7 Jan 2020 21:23:02 +0100
Subject: [Buildroot] [PATCH] package/coreutils: drop useless patch
In-Reply-To: <20200106212336.7411-1-yann.morin.1998@free.fr>
References: <20200106212336.7411-1-yann.morin.1998@free.fr>
Message-ID: <20200107212302.56f1842c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jan 2020 22:23:36 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Until version 8.23, we needed to patch coreutils to ensure that options
> be passed before non-options when calling help2man (during the build).
> Our patch would just swap around two consecutive lines, and required
> autoreconfguring and gettextising.
> 
> However, in coreutils 8.24, upstream applied a semantically equivalent
> fix, but we did not notice, and we blindly fixed the patch by swapping
> the previously faulty lines, even though the issue was no longer present
> to begin with (if one would need an example of cargo cult, this is it).
> 
> Drop our patch, as it has not been needed for the past 4.5 years.
> 
> This means that we can also stop autoreconfiguring and gettextising.
> Woot!
> 
> Rename the remaining patch.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../0001-fix-for-dummy-man-usage.patch        | 25 -------------------
>  ... 0001-strtod_fix_clash_with_strtold.patch} |  0
>  package/coreutils/coreutils.mk                |  4 ---
>  3 files changed, 29 deletions(-)
>  delete mode 100644 package/coreutils/0001-fix-for-dummy-man-usage.patch
>  rename package/coreutils/{0002-strtod_fix_clash_with_strtold.patch => 0001-strtod_fix_clash_with_strtold.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
