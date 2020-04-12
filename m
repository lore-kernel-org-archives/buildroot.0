From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 21:14:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: fix pkg-config --static
In-Reply-To: <20200215152620.3553021-1-fontaine.fabrice@gmail.com>
References: <20200215152620.3553021-1-fontaine.fabrice@gmail.com>
Message-ID: <20200412211446.1789f4f0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Feb 2020 16:26:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pkg-config wrapper is not used since commit
> 4e0bc29993376613d200e892d491e31ea5a49622, this raise static build
> failures with libglib2 because --static is not passed anymore to
> pkg-config so add a patch to get back the old behaviour.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0d36952def63cb69628697fa6408aeb6ce10cb5b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...dencies-base.py-add-pkg_config_stati.patch | 38 +++++++++++++++++++
>  package/meson/cross-compilation.conf.in       |  1 +
>  package/pkg-meson.mk                          |  1 +
>  3 files changed, 40 insertions(+)
>  create mode 100644 package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch

So, the feedback from upstream at
https://github.com/mesonbuild/meson/pull/6629 was not very positive,
and they suggested how it should be implemented.

However, in the mean time, we are a bit screwed, and libglib2 has
continued to fail building consistently in our autobuilders since then.

Since your solution Fabrice is simple enough and straightforward, I
decided to apply it nevertheless. I just made sure setting the STATIC
property is done in both the per-package cross-compilation.conf and the
global cross-compilation.conf.

It would however be nice to keep working on the issue with upstream, so
that we get a proper solution at some point in the future.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
