From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 19:02:25 +0200
Subject: [Buildroot] [PATCH] package/meson: force ext static libs when
 BR2_STATIC_LIBS
In-Reply-To: <20191026153006.25122-1-matthew.weber@rockwellcollins.com>
References: <20191026153006.25122-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191026190225.45f01aa4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 10:30:06 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> This patch adds a case in the library pattern logic to prefer static
> libraries when the Meson Core option for "default_library" is set to
> solely static.
> 
> The existing library search order makes sense for cases of shared and
> shared / static mixed. However if using a prebuilt cross-toolchain,
> they usually provide both a static and shared version of sysroot
> libraries. This presents a problem in a complete static build where
> there won't be shared libraries at runtime and during build time there
> are failures like "ld: attempted static link of dynamic object".
> 
> Bug:
> https://github.com/mesonbuild/meson/issues/6108
> 
> Fixes:
> http://autobuild.buildroot.net/results/db1740b4777f436324218c52bc7b08e5c21b667d/
> http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba5be/
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  ...tic-libs-when-default-library-static.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/meson/0003-Prefer-ext-static-libs-when-default-library-static.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
