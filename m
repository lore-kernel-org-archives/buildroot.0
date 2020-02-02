From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 21:07:18 +0100
Subject: [Buildroot] [PATCH] linux/linux.mk: use HOST_MAKE_ENV rather
 than TARGET_MAKE_ENV
In-Reply-To: <20200131174940.12469-1-peter@korsgaard.com>
References: <20200131174940.12469-1-peter@korsgaard.com>
Message-ID: <20200202210718.41881805@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jan 2020 18:49:39 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> While the kernel is built for the target, the build may need various host
> libraries depending on config (and kernel version), so use HOST_MAKE_ENV
> instead of TARGET_MAKE_ENV.
> 
> In particular, this ensures that our host-pkgconf will look for host
> libraries and not target ones.
> 
> Fixes building scripts/dtc for Buildroot configurations enabling libyaml and
> host-pkgconf for kernels after commit 067c650c45 (dtc: Use pkg-config to
> locate libyaml).
> 
> With this enabled, we can drop the PKG_CONFIG_* variables for the
> _NEEDS_HOST_LIBELF conditional, as those are included in HOST_MAKE_ENV.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  linux/linux.mk | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
