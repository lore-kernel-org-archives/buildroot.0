From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Jun 2019 17:16:02 +0200
Subject: [Buildroot] [PATCH] package/quazip: upgrade to v0.8.1
In-Reply-To: <20190630143352.25100-1-zgyarmati@zgyarmati.de>
References: <20190630143352.25100-1-zgyarmati@zgyarmati.de>
Message-ID: <80a737ac-4df5-3f98-b35b-b9d345e20e6b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Zoltan,

On 30/06/2019 16:33, Zoltan Gyarmati wrote:
> And also register the hash of the COPYING file
> 
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  package/quazip/quazip.hash | 6 ++++--
>  package/quazip/quazip.mk   | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
> index 9f43643d6b..dc19fe8ccd 100644
> --- a/package/quazip/quazip.hash
> +++ b/package/quazip/quazip.hash
> @@ -1,2 +1,4 @@
> -# From github release page
> -sha256 4118a830a375a81211956611cc34b1b5b4ddc108c126287b91b40c2493046b70 quazip-0.7.6.tar.gz
> +# Locally computed
> +sha256 4fda4d4248e08015b5090d0369ef9e68bdc4475aa12494f7c0f6d79e43270d14 quazip-v0.8.1.tar.gz
> +sha256 d2a653b46b87963f29a7f1523e7c39bafdbb3592dfa01725e61a523387148e72 COPYING
> +
> diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
> index aba8274506..886e3b323d 100644
> --- a/package/quazip/quazip.mk
> +++ b/package/quazip/quazip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -QUAZIP_VERSION = 0.7.6
> +QUAZIP_VERSION = v0.8.1

 We just removed the 'v' from the version in all packages, to match the version
tag on release-monitoring.org. So please add the v as part of the _SITE instead.

 Regards,
 Arnout

>  QUAZIP_SITE = $(call github,stachenov,quazip,$(QUAZIP_VERSION))
>  QUAZIP_INSTALL_STAGING = YES
>  QUAZIP_DEPENDENCIES = \
> 
