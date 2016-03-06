From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 06 Mar 2016 02:17:44 -0300
Subject: [Buildroot] [PATCH v2] package/scrub: new package
Message-ID: <56dbbd78cd5d0_1fa53fb8909759a414311@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

Below some comments about:
- your patch was merged upstream!
- license files
- website

On Mon, 18 Jan 2016 22:12:23 +0100, Samuel Martin wrote:
> Add a patch fixing autoreconf call.
> Patch already sent upstream.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
[snip]
> --- /dev/null
> +++ b/package/scrub/0001-configure.ac-make-sure-m4-macros-are-included-in-the.patch
> @@ -0,0 +1,49 @@
> +Fetched from: https://github.com/chaos/scrub/pull/7

This patch can now be used with _PATCH since it is merged to upstream.

[snip]
> +++ b/package/scrub/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_SCRUB
> +	bool "scrub"
> +	help
> +	  Scrub iteratively writes patterns on files or disk devices to make
> +	  retrieving the data more difficult.
> +
> +	  https://code.google.com/p/diskscrub/

Google Code is being shut down. I think it's better to use
https://github.com/chaos/scrub/
here. See
git log -Scode.google

[snip]
> +++ b/package/scrub/scrub.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# scrub
> +#
> +################################################################################
> +
> +SCRUB_VERSION = 2.6.1

You could now change the version to the upstream master
or keep this version and add
SCRUB_PATCH = https://github.com/chaos/scrub/commit/11d30916dd9c11a26c7c8a0f6db9e6ebca301594.patch
and its hash

Based on the output from
git log -S_PATCH
I think using _PATCH is ok in this case.
Some use it after _SITE, others use it after _LICENSE_FILES.

> +SCRUB_SITE = $(call github,chaos,scrub,$(SCRUB_VERSION))
> +SCRUB_LICENSE = GPLv2+
> +SCRUB_LICENSE_FILES = COPYING

COPYING is the license raw text.
I think adding also DISCLAIMER would be nice since it brings this text:
"
Scrub is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free
Software Foundation; either version 2 of the License, or (at your option)
any later version.
"

> +
> +# Fetching from the git repo, no configure/Makefile generated, and patching
> +# configure.ac
> +SCRUB_AUTORECONF = YES
> +
> +$(eval $(autotools-package))
> -- 
> 2.7.0

Regards,
Ricardo
