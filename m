From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 15:22:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/cdrkit: standardize site URL
In-Reply-To: <1413983659-3496-1-git-send-email-kaszak@gmail.com>
References: <1413983659-3496-1-git-send-email-kaszak@gmail.com>
Message-ID: <20141022152231.1ecdf27a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Wed, 22 Oct 2014 15:14:19 +0200, Karoly Kasza wrote:
> Standardize download site URL using the Debian mirror.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  package/cdrkit/cdrkit.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
> index 3f2b429..e1392b6 100644
> --- a/package/cdrkit/cdrkit.mk
> +++ b/package/cdrkit/cdrkit.mk
> @@ -6,7 +6,7 @@
>  
>  CDRKIT_VERSION = 1.1.11
>  CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
> -CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20101018T151929Z/pool/main/c/cdrkit/
> +CDRKIT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cdrkit
>  CDRKIT_DEPENDENCIES = libcap bzip2 zlib
>  CDRKIT_LICENSE = GPLv2
>  CDRKIT_LICENSE_FILES = COPYING

Yeah, well, actually, I believe using snapshot.debian.org is a better
idea, since it guarantees that files won't be moved. While using
$(BR2_DEBIAN_MIRROR) means that we point to locations where tarballs
will disappear at some point. At least, we've seen that in the past.

So maybe we should rather get rid of BR2_DEBIAN_MIRROR and make sure
all packages downloading their source from Debian use
snapshot.debian.org instead.

Thoughts?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
