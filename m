From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 14:11:40 +0200
Subject: [Buildroot] [PATCH 3/3] package/ima-evm-utils: fix build on musl
In-Reply-To: <20200722193532.32150-3-petr.vorel@gmail.com>
References: <20200722193532.32150-1-petr.vorel@gmail.com>
 <20200722193532.32150-3-petr.vorel@gmail.com>
Message-ID: <20200723141140.0af45237@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jul 2020 21:35:32 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Fixes:
>                    br-arm-cortex-a9-musl [ 7/44]: FAILED
>                 br-i386-pentium-mmx-musl [12/44]: FAILED
>                           br-x86-64-musl [34/44]: FAILED
>                           linaro-aarch64 [36/44]: FAILED
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Same question as for PATCH 2/3: is this needed after the 1.3 version
bump, or is this needed independently of the version bump.

There are two possibilities:

 - The fixes of PATCH 2/3 and PATCH 3/3 are needed independently of the
   version bump. In this case, they should be in the patch series
   *before* the 1.3 version bump, so that we know those fixes can for
   example be backported to our LTS/stable branch.

 - The fixes of PATCH 2/3 and PATCH 3/3 are needed due to
   issues/regressions introduced by the 1.3 version bump. In this case,
   they should be part of the version bump patch itself, to not break
   bisectability.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
