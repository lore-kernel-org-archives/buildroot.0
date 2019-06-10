From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 19:59:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/swupdate: bump to version
 2019.04
In-Reply-To: <1560180656-17519-1-git-send-email-pjtexier@koncepto.io>
References: <1560180656-17519-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <40dcf91d-c7c3-c377-5204-eade8cd1d234@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Pierre-Jean,

On 10/06/2019 17:30, Pierre-Jean Texier wrote:
> New features in this release:
>  - Improved documentation
>  - delta updates based on rdiff library
>  - support for libubootenv
>  - dry-run option
>  - CA certificates for signed images
>  - Fix security leak in parser
> 
> This commit also:
>  - introduce BR2_PACKAGE_LIBRSYNC
>  - introduce BR2_PACKAGE_LIBUBOOTENV
>  - drop upstreamed patch
>  - backport upstream patches (important fix)

 Please also mention that you regenerate the default swupdate.config, and that
you always enable CONFIG_GUNZIP because gunzip is provided by the default
busybox config.

[snip]
> diff --git a/package/swupdate/0001-archive-handler-set-locale-for-libarchive.patch b/package/swupdate/0001-archive-handler-set-locale-for-libarchive.patch
> new file mode 100644
> index 0000000..7403097
> --- /dev/null
> +++ b/package/swupdate/0001-archive-handler-set-locale-for-libarchive.patch
> @@ -0,0 +1,64 @@
> +From 95a2b9961119aac80aea1eeabbc1cd52b72d876a Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Sat, 4 May 2019 11:38:37 -0600
> +Subject: [PATCH] archive handler: set locale for libarchive
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[Backported from: 95a2b9961119aac80aea1eeabbc1cd52b72d876a]

 You need to add your Signed-off-by here. This is a short way for you to
assert that you are entitled to contribute the patch under upstream's
GPL license.  See  http://elinux.org/Developer_Certificate_Of_Origin
for more details. It is needed here in addition to the commit message of the
Buildroot commit, because the license of the package may be different than
Buildroot's.

 Same for the other two patches.

[snip]
> @@ -95,6 +98,10 @@ else
>  SWUPDATE_MAKE_ENV += HAVE_ZLIB=n
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBRSYNC),y)
> +SWUPDATE_DEPENDENCIES += librsync
> +endif

 Nothing in .config needed for this?

 Regards,
 Arnout
