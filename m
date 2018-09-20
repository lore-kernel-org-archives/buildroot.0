From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 21:27:48 +0200
Subject: [Buildroot] [PATCH] libv4l: fix build with glibc 2.28
In-Reply-To: <7acb964ef43990041ffde9bf8477122943a1c5aa.1537386923.git.baruch@tkos.co.il>
References: <7acb964ef43990041ffde9bf8477122943a1c5aa.1537386923.git.baruch@tkos.co.il>
Message-ID: <20180920212748.2bc0b59a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Sep 2018 22:55:23 +0300, Baruch Siach wrote:
> Add two upstream patches adding the needed header for the major/minor
> macros.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f38/f3858970c1bbb7b0201389f7656c9ccf15a59fda/
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I've applied, but I have one request, see below.


> diff --git a/package/libv4l/0006-fix-glibc-2.28-build.patch b/package/libv4l/0006-fix-glibc-2.28-build.patch
> new file mode 100644
> index 000000000000..295c0bb54525
> --- /dev/null
> +++ b/package/libv4l/0006-fix-glibc-2.28-build.patch
> @@ -0,0 +1,23 @@
> +v4l2-ctl: fix glibc 2.28 build
> +
> +Include header needed for the major/minor macros in glibc 2.28+.
> +
> +This patch is extracted from upstream commit 65e7b2a4076845d (v4l2-ctl: show
> +media/entity info if available).
> +
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>

This patch should have been Git-formatted, just like the other 5
patches that already existed in libv4l. I fixed that up when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
