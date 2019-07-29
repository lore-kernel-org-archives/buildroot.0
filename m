From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jul 2019 09:25:00 +0200
Subject: [Buildroot] [PATCH] dtc: Bump to version v1.5.0
In-Reply-To: <20190722042113.10140-1-joel@jms.id.au>
References: <20190722042113.10140-1-joel@jms.id.au>
Message-ID: <20190729092500.530bbcb8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jul 2019 13:51:12 +0930
Joel Stanley <joel@jms.id.au> wrote:

> Upstream now optionally supports a yaml output format, and support is
> detected through pkg-config. It has not been added as a dependency but
> could in the future if someone asks for it.
> 
> Patches applied upstream:
> 
>   - Kill bogus TYPE_BLOB marker type
>   - checks: fix simple-bus compatible matching
> 
> New patch:
> 
>  - Makefile: Add EXTRA_CFLAGS variable
> 
> The new patch is required to correctly add buildroot's cflags. The
> existing packaging was overwriting those set by the package's makefile,
> which was breaking the yaml detection.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  ...rds-for-older-kernel-u-boot-sources.patch} |   0
>  ...001-Kill-bogus-TYPE_BLOB-marker-type.patch | 138 ------------------
>  ...2-Makefile-Add-EXTRA_CFLAGS-variable.patch |  37 +++++
>  ...s-fix-simple-bus-compatible-matching.patch | 120 ---------------
>  package/dtc/dtc.hash                          |   2 +-
>  package/dtc/dtc.mk                            |  10 +-
>  6 files changed, 43 insertions(+), 264 deletions(-)
>  rename package/dtc/{0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch => 0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch} (100%)
>  delete mode 100644 package/dtc/0001-Kill-bogus-TYPE_BLOB-marker-type.patch
>  create mode 100644 package/dtc/0002-Makefile-Add-EXTRA_CFLAGS-variable.patch
>  delete mode 100644 package/dtc/0003-checks-fix-simple-bus-compatible-matching.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
