From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:45:32 +0200
Subject: [Buildroot] [PATCH] swupdate: switch to local config librt
 dependency
In-Reply-To: <097cb7c8a9791944b484ec31f2cc5660331411c6.1496939346.git.baruch@tkos.co.il>
References: <097cb7c8a9791944b484ec31f2cc5660331411c6.1496939346.git.baruch@tkos.co.il>
Message-ID: <20170608214532.7b77d220@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Jun 2017 19:29:06 +0300, Baruch Siach wrote:
> Upstream rejected[1] the patch added in commit 6a1aa4e2daf0 (swupdate: fix
> build with older glibc). Instead of carrying this patch going forward, make
> librt an extra library dependency in the Buildroot local swupdate .config.
> 
> This solution is somewhat less optimal than the patch, because it always adds
> librt regardless of whether SURICATTA_HAWKBIT is enabled. In theory we could
> add a test for (BR2_PACKAGE_JSON_C && BR2_PACKAGE_LIBCURL), which are the
> SURICATTA_HAWKBIT dependencies, and edit .config at build time. But this adds
> much complexity for little gain.
> 
> [1] https://groups.google.com/forum/?hl=en#!topic/swupdate/77QWIka27es
> 
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied. Thanks!

> With glibc 2.17 being 4.5 years old, upstream maintainers start to push back
> on these librt patches. Is it time to stop support for external toolchains
> with older glibc? This means retiring CodeSourcery x86 and SH toolchains.

That's a good question. I think supporting relatively old
configurations is a strength of Buildroot, so I try to be careful when
removing support for old stuff. But maybe glibc 2.17 is now really too
old.

Thoughts of other developers?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
