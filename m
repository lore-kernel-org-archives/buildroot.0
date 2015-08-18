From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:18:26 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/nbd: fix static builds
In-Reply-To: <1439495731-8645-1-git-send-email-yann.morin.1998@free.fr>
References: <1439495731-8645-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150818111826.16620df1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 13 Aug 2015 21:55:31 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/aa8/aa8a1ac35a93e1c8b9fddbc2b5d66ecaa921f31e/ (arm)
>     http://autobuild.buildroot.org/results/e5b/e5bd05623dd6c57bb0338592ecd21a5ba0cbe95a/ (arc)
>     http://autobuild.buildroot.org/results/e0f/e0fd23eec2dd31bece122d84515b2b7cb14594b8/ (ppc)
>     http://autobuild.buildroot.org/results/3a2/3a2d4124f78d4e504e8e961fabe038e570923408/ (mips)
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/nbd/0001-avoid-name-clashing.patch | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/nbd/0001-avoid-name-clashing.patch
> 
> diff --git a/package/nbd/0001-avoid-name-clashing.patch b/package/nbd/0001-avoid-name-clashing.patch
> new file mode 100644
> index 0000000..b3ea9c9
> --- /dev/null
> +++ b/package/nbd/0001-avoid-name-clashing.patch
> @@ -0,0 +1,28 @@
> +rename err() function to avoid clashing with err() form C library
> +
> +err() is a function available in the C library, so when static linking,
> +there is a clash at link timebecause the function is provided both by
> +nbd and the C library:
> +    http://autobuild.buildroot.org/results/aa8/aa8a1ac35a93e1c8b9fddbc2b5d66ecaa921f31e/build-end.log
> +
> +Fix that by renaming err() to nbd_err() and providing a small maco
> +wrapper to avoid touching the many call sites.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +---
> +Upstream status: hack, not submitted.

Please submit the patch upstream anyway, so that upstream is aware of
the problem, and hopefully implements a proper solution.

I've applied your patch to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
