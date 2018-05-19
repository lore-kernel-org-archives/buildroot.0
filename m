From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:47:31 +0200
Subject: [Buildroot] [PATCH] uclibc: ARC: Don't mess with CPU selection
In-Reply-To: <20180514174315.15432-1-abrodkin@synopsys.com>
References: <20180514174315.15432-1-abrodkin@synopsys.com>
Message-ID: <20180519224731.3bb5c398@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 May 2018 20:43:15 +0300, Alexey Brodkin wrote:
> Since uClibc-ng commit cde74b83f9b2 "ARC: remove special CFLAGS/LDFLAGS handling"
> i.e. starting v1.0.23 CONFIG_ARC_CPU_xx options are not used.
> 
> Instead uClibc relies on toolchain defaults or build-system CFLAGS
> for selection of ARC-specific code (i.e. distinguishes between
> ARCompact and ARCv2 ISAs).
> 
> So we drop corresponding quirks from Buildroot as well.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/Config.in | 7 -------
>  package/uclibc/uclibc.mk | 6 ------
>  2 files changed, 13 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
