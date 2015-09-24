From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Sep 2015 11:54:36 +0100
Subject: [Buildroot] [PATCH 1/1] drbd-utils: bump version to 8.9.4
In-Reply-To: <1442825281-16987-1-git-send-email-cvubrugier@fastmail.fm>
References: <1442825281-16987-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <5603D66C.6050505@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On 09/21/2015 09:48 AM, Christophe Vu-Brugier wrote:
> Version 8.9.4 of drbd-utils contains fixes for the musl C library.
> 
> Fixes http://autobuild.buildroot.net/results/4e0/4e0ed65b2e06f4ccadcad5b4302e6334667ecbdb

There is a comment below that will require you to send a v2 of your
patch. When you do it, could you please add the autobuild URL in this way?

-------------
Fixes:

<space><space><here the autobuil url>
-------------

That's the most common way to point to an autobuild URL in the commit
log. See an example:

http://git.buildroot.net/buildroot/commit/?id=9119c1e6586d0719cec0f39488c22f136da318f1

> Moreover, this commit removes the hook used to disable the
> documentation which is no longer necessary.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  package/drbd-utils/drbd-utils.hash | 2 +-
>  package/drbd-utils/drbd-utils.mk   | 8 +-------
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
> index c9894cd..731526e 100644
> --- a/package/drbd-utils/drbd-utils.hash
> +++ b/package/drbd-utils/drbd-utils.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256	2c531655d0d198a6af055edbc90f232538c2a3d2ce3fe137d03d06de4c1166d7	drbd-utils-8.9.1.tar.gz
> +sha256	01a8924f8bc1370fc91e0495989d69b65c3b08346006d614d4b1dbdcd1caade5	drbd-utils-8.9.4.tar.gz

That hash value is wrong:

ERROR: drbd-utils-8.9.4.tar.gz has wrong sha256 hash:
ERROR: expected:
01a8924f8bc1370fc91e0495989d69b65c3b08346006d614d4b1dbdcd1caade5
ERROR: got     :
38929279d1bf549fd1ade4ce6773a6fe209db51bbb0efe7bf6d2b7871ba0afbc

Please send an v2 with the right hash value.

Regards,

Vincent.

> diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
> index 5df5b81..627b9a4 100644
> --- a/package/drbd-utils/drbd-utils.mk
> +++ b/package/drbd-utils/drbd-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DRBD_UTILS_VERSION = 8.9.1
> +DRBD_UTILS_VERSION = 8.9.4
>  DRBD_UTILS_SITE = http://oss.linbit.com/drbd/
>  DRBD_UTILS_LICENSE = GPLv2+
>  DRBD_UTILS_LICENSE_FILES = COPYING
> @@ -26,10 +26,4 @@ else
>  DRBD_UTILS_CONF_OPTS += --with-udev=no
>  endif
>  
> -# Do not build the documentation because it requires docbook
> -define DRBD_UTILS_DISABLE_DOCS
> -	$(SED) 's/user scripts documentation/user scripts/' $(@D)/Makefile.in
> -endef
> -DRBD_UTILS_POST_PATCH_HOOKS += DRBD_UTILS_DISABLE_DOCS
> -
>  $(eval $(autotools-package))
> 
