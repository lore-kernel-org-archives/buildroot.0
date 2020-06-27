From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 17:20:22 +0200
Subject: [Buildroot] [PATCH] toolchain/toolchain-wrapper: let recent GCC
 handle SOURCE_DATE_EPOCH
In-Reply-To: <20200626154927.3185266-1-john@metanate.com>
References: <20200626154927.3185266-1-john@metanate.com>
Message-ID: <20200627172022.10010285@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 26 Jun 2020 16:49:27 +0100
John Keeping <john@metanate.com> wrote:

> When using precompiled headers, changing any macros defined on the
> command line will invalidate the precompiled header.  With
> toolchain-wrapper adding __DATE__ and __TIME__, any commits to Buildroot
> will invalidate incremental builds regardless of whether the precompiled
> header actually uses those values (affecting _OVERRIDE_SRCDIR).
> 
> GCC-7 and later support SOURCE_DATE_EPOCH and use it to define __DATE__
> and __TIME__ internally, avoiding any impact on precompiled headers.
> 
> Disable the custom handling in toolchain-wrapper if GCC is version 7 or
> newer.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  toolchain/toolchain-wrapper.c  | 10 ++++++++++
>  toolchain/toolchain-wrapper.mk |  3 +++
>  2 files changed, 13 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
