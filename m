From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 23:25:47 +0100
Subject: [Buildroot] [PATCH 1/7 v4] docs/manual: document the test-pkg
 script
In-Reply-To: <85dd7875a12e1ceb9dab2f006dd34a8259836729.1487195062.git.yann.morin.1998@free.fr>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
 <85dd7875a12e1ceb9dab2f006dd34a8259836729.1487195062.git.yann.morin.1998@free.fr>
Message-ID: <20170215232547.24a6cb92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this update!

On Wed, 15 Feb 2017 22:44:29 +0100, Yann E. MORIN wrote:

> +First, create a config snippet that contains all the necessary options
> +needed to enabel your package, but without any architecture or toolchain

enable

> +The results mean:
> +
> +* `OK`: the build was successful
> +* `SKIPPED`: one or more config options from the config snippet were
> +  missing in the resulting configuration; inspect the file +config.missing+
> +  in the output build directory (+~/br-test-pkg/TOOLCHAIN_NAME/+ by
> +  default)

I would expand this explanation a bit here. As you wrote it might seem
like it is not normal for a toolchain to be skipped. What about instead:

 `SKIPPED`: one or more configuration options listed in the config
 snipped were not present in the final configuration. This is due to
 options having dependencies not satisfied by the toolchain, such as
 for example a package that +depends on BR2_USE_MMU+ with a noMMU
 toolchain.

> +When there are failures, you can just re-run the script with the same
> +options (after you fixed your package); the script will attempt to re-build
> +the package for all toolchains, without the need to re-build all the
> +dependencies of that package (but it requires the +-p+ optiopn, see below).

"see below" ? but there's nothing below.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
