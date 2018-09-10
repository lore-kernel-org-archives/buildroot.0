From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:37:54 +0200
Subject: [Buildroot] [PATCH] shairport-sync: add upstream patch to fix
 soxr configure issue
In-Reply-To: <20180909094317.10873-1-joerg.krause@embedded.rocks>
References: <20180909094317.10873-1-joerg.krause@embedded.rocks>
Message-ID: <20180910173754.61fc84ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 11:43:17 +0200, J?rg Krause wrote:
> Commit b06639cf7a adds an upstream patch to fix a build issue with soxr.
> The patch also adds detecting soxr using pkg-config. Upstream detected
> an config issue [1], where the resulting binary lacks soxr support, although
> libsoxr was correctly detected.
> 
> This patch adds a define for `HAVE_LIBSOXR` when using pkg-config.
> 
> Backported from: cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9
> 
> [1] https://github.com/mikebrady/shairport-sync/issues/740
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Thanks for the additional explanations you have given, I have applied
after fixing the reference to the previous commit in the commit log. I
however have one request below.

> diff --git a/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch b/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch
> new file mode 100644
> index 0000000000..e10142a201
> --- /dev/null
> +++ b/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch
> @@ -0,0 +1,34 @@
> +From cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9 Mon Sep 17 00:00:00 2001
> +From: Mike Brady <mikebrady@eircom.net>
> +Date: Sat, 8 Sep 2018 15:06:18 +0100
> +Subject: [PATCH] Include a definition of HAVE_LIBSOXR with using pkg_config
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Commit b06639cf7a adds an upstream patch to fix a build issue with soxr.

The patch descriptions should ideally not refer to Buildroot or
Buildroot commits. Indeed, they should ideally be just the upstream
patch, or a patch acceptable by upstream. A patch that talks about
Buildroot commits is unlikely to be accepted upstream.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
