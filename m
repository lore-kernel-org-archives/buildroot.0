From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 22:32:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgit2: Bump to version 1.0.0
In-Reply-To: <20200414091439.25465-1-nicolas.cavallari@green-communications.fr>
References: <20200414091439.25465-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20200415223258.2d5d406c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Apr 2020 11:14:39 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> diff --git a/package/libgit2/Config.in b/package/libgit2/Config.in
> index 53ba4d4245..02c51448ff 100644
> --- a/package/libgit2/Config.in
> +++ b/package/libgit2/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_LIBGIT2
>  	bool "libgit2"
> +	depends on !BR2_STATIC_LIBS # libhttpparser

This requires the addition of a Config.in comment.

> -LIBGIT2_VERSION = 0.28.4
> -LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
> -LIBGIT2_LICENSE = GPL-2.0 with linking exception
> +LIBGIT2_VERSION = 1.0.0
> +LIBGIT2_SITE = https://github.com/libgit2/libgit2/releases/download/v1.0.0

Instead of hardcoding v1.0.0 in the URL, use $(LIBGIT2_VERSION)

> +LIBGIT2_LICENSE = GPL-2.0 with linking exception, BSD 4-clause variant (wildmatch), MIT (sha1)

But here is the part that made me not apply the patch: this BSD
4-clause variant thing. The license text is at
https://github.com/libgit2/libgit2/blob/master/COPYING#L995 and it
doesn't seem to be a license known at https://spdx.org/licenses/. I'm
not sure how to properly encode it.

Yann, Arnout, any suggestion?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
