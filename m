From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Feb 2019 15:38:07 +0100
Subject: [Buildroot] [PATCH] xenomai: move arch restriction to Cobalt
 core, no restriction for Mercury
In-Reply-To: <20190205160959.25927-1-patrickdepinguin@gmail.com>
References: <20190205160959.25927-1-patrickdepinguin@gmail.com>
Message-ID: <20190209153807.57481152@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Feb 2019 17:09:59 +0100
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
> Nevertheless, even for Mercury, there are some restrictions:
> - pthread_atfork is used, which requires an MMU
> - sync functions like __sync_sub_and_fetch and __sync_add_and_fetch are
>   expected.
> 
> As the corresponding 'linux extension' selects Xenomai, we add the
> MMU and sync dependencies there too. They may or may not already be covered
> by XENOMAI_COBALT_ARCH_SUPPORTS flag.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  linux/Config.ext.in       | 12 ++++++++----
>  package/xenomai/Config.in | 11 +++++++----
>  2 files changed, 15 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
