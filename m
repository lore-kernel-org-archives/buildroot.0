From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 21:49:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump version to
 0.10.7
In-Reply-To: <20191006115906.24615-1-maxime.madau@smile.fr>
References: <20191006115906.24615-1-maxime.madau@smile.fr>
Message-ID: <20191007214934.61cf1d5b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Oct 2019 13:59:06 +0200
Maxime Madau <maxime.madau@smile.fr> wrote:

> Signed-off-by: Maxime Madau <maxime.madau@smile.fr>

Thanks for your contribution. However, there was one issue, see below.

> diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
> index 4356f55849..6be4516bde 100644
> --- a/package/stress-ng/stress-ng.hash
> +++ b/package/stress-ng/stress-ng.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 ea1ba0e96637d7ecc0d2b08c981c4fcb3e7753ca7d64d76210154440b9a194e6 stress-ng-0.09.58.tar.xz
> -sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
> +sha256 85ae86587f605225cc736e1ddba6cc5fd129dfbba0f7d94df755e2e6ac5230e6 stress-ng-0.10.07.tar.xz
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 stress-ng-0.10.07/COPYING

Changing "COPYING" to stress-ng-0.10.07/COPYING was not correct. With
your change applied, "make legal-info" was saying:

>>> stress-ng 0.10.07 Collecting legal info
ERROR: No hash found for COPYING

Indeed, the paths of license files are relative to the main directory
of the current package source tree. Once fixed to be just "COPYING"
like it was before your change gives:

>>> stress-ng 0.10.07 Collecting legal info
COPYING: OK (sha256: 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643)

So I fixed this issue, and applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
