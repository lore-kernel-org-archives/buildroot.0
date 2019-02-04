From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 22:00:31 +0100
Subject: [Buildroot] [PATCH] xenomai: move arch restriction to Cobalt
 core, no restriction for Mercury
In-Reply-To: <20190121195005.17768-1-patrickdepinguin@gmail.com>
References: <20190121195005.17768-1-patrickdepinguin@gmail.com>
Message-ID: <20190204220031.19daf588@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jan 2019 20:50:04 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Xenomai has two mutually exclusive cores:
> - Cobalt: dual-kernel approach: patched kernel + userland
> - Mercury: only userland
> 
> In the Cobalt core, not all architectures are supported. This is the source
> of the existing ARCH_SUPPORTS variable.
> 
> In the Mercury core, there is no imposed architecture restriction.
> 
> Rename the XENOMAI_ARCH_SUPPORTS flag to XENOMAI_COBALT_ARCH_SUPPORTS and
> move its check from the Xenomai package to the Cobalt core.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  linux/Config.ext.in       | 4 ++--
>  package/xenomai/Config.in | 5 ++---
>  2 files changed, 4 insertions(+), 5 deletions(-)

The patch looks good, but it needs more testing. Because it lifts all
the architecture dependencies, one can now try to build Xenomai for
funky architectures/configurations, and it doesn't always work. For
example, building with our br-arm-cortex-m4-full configuration fails
with a pthread_atfork issue.

I think this requires running a test-pkg run to check a couple of
architectures/configurations.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
