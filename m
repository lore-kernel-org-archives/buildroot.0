From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:21:32 +0100
Subject: [Buildroot] [PATCH/next] toolchain-external: support gcc < 4.3
In-Reply-To: <20161123111404.20661-1-arnout@mind.be>
References: <20161123111404.20661-1-arnout@mind.be>
Message-ID: <20161123232132.66194af8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 12:14:04 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> This patch conflicts with the external toolchain rework - I'll rebase
> the one which "looses" in the first-to-be-committed contest.

external toolchain rework committed :)

> 
> We should also remove the 4.3 and 4.4 options, because they are
> currently unused and also untested in the autobuilders.
> 
> I think something similar should be done for kernel headers.

We already have something like this: we have
BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD.

>  toolchain/helpers.mk                   |  3 +--
>  toolchain/toolchain-external/Config.in | 11 +++++++++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 3991bc1..72e7292 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -145,8 +145,7 @@ check_kernel_headers_version = \
>  check_gcc_version = \
>  	expected_version="$(strip $2)" ; \
>  	if [ -z "$${expected_version}" ]; then \
> -		printf "Internal error, gcc version unknown (no GCC_AT_LEAST_X_Y selected)\n"; \
> -		exit 1 ; \
> +		exit 0 ; \

Why?

Assuming you will respin, I've marked this one as Changes Requested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
