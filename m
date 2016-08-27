From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 15:33:16 +0200
Subject: [Buildroot] [PATCH] Trousers: fix build with musl
In-Reply-To: <1472203656-5901-1-git-send-email-nrubinstein@aldebaran.com>
References: <1472203656-5901-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20160827153316.5c967eb7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch! I've applied to master, but I have some comments
nonetheless.

"Trousers" should have been "trousers" in the commit title.

On Fri, 26 Aug 2016 11:27:36 +0200, noe.rubinstein at gmail.com wrote:
> From: No? Rubinstein <nrubinstein@aldebaran.com>
> 
> The trousers code uses getpwent_r, which is not available in musl.
> Detect the availability of getpwent_r in the TrouSerS build system, and
> use it conditionally.
> 
> This broke the build of tpm-tools because linking with libtspi.so
> failed.
> 
> Fixes this build failure:
> http://autobuild.buildroot.net/results/830fc20c68a0653afa5567edffc2ededc4e45cc6
> 
> ---

You shouldn't have added this "---" sign here... or at least you should
have put your SoB line *before* it.

> Runtime-tested by running tpm_version in a chroot and verifying that it
> creates a "user.data" file with both the Buildroot-provided CodeSourcery
> and Musl toolchains on x86_64.
> 
> Build tested with
> http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2016.08-rc1-4-g07e8d1c.tar.bz2
> 
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
> ---
>  ...t-getpwent_r-is-available-before-using-it.patch | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 package/trousers/0004-Check-that-getpwent_r-is-available-before-using-it.patch
> 
> diff --git a/package/trousers/0004-Check-that-getpwent_r-is-available-before-using-it.patch b/package/trousers/0004-Check-that-getpwent_r-is-available-before-using-it.patch
> new file mode 100644
> index 0000000..6ed440e
> --- /dev/null
> +++ b/package/trousers/0004-Check-that-getpwent_r-is-available-before-using-it.patch
> @@ -0,0 +1,78 @@
> +From 9e42c405f30d2b52d019598436ea346ef8586f43 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <nrubinstein@aldebaran.com>
> +Date: Wed, 24 Aug 2016 18:55:25 +0200
> +Subject: [PATCH] Check that getpwent_r is available before using it
> +
> +This fixes building trousers with musl

And you should have added your SoB line here as well.

I've fixed up those issues and applied. Please submit the patch
upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
