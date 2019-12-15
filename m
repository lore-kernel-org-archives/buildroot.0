From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 15 Dec 2019 13:06:49 +0100
Subject: [Buildroot] [PATCH] package/openal: Switch to github mirror
In-Reply-To: <20191215115801.686-1-nerv@dawncrow.de>
References: <20191215115801.686-1-nerv@dawncrow.de>
Message-ID: <b691a6da-65fc-b0c8-9102-093727d883b6@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 15.12.19 um 12:58 schrieb Andr? Hentschel:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/openal/openal.hash | 2 +-
>  package/openal/openal.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openal/openal.hash b/package/openal/openal.hash
> index 219e334e6e..a133808cae 100644
> --- a/package/openal/openal.hash
> +++ b/package/openal/openal.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 5c2f87ff5188b95e0dc4769719a9d89ce435b8322b4478b95dd4b427fe84b2e9  openal-soft-1.19.1.tar.bz2
> +sha256 9f3536ab2bb7781dbafabc6a61e0b34b17edd16bd6c2eaf2ae71bc63078f98c7  openal-1.19.1.tar.gz
>  sha256 d808ce217e5b611854da622b57ec29fe545584c48bc5352fae72a4b6e5074a15  COPYING
> diff --git a/package/openal/openal.mk b/package/openal/openal.mk
> index e15cf320c0..8e761a8d9b 100644
> --- a/package/openal/openal.mk
> +++ b/package/openal/openal.mk
> @@ -5,8 +5,7 @@
>  ################################################################################
>  
>  OPENAL_VERSION = 1.19.1
> -OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
> -OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
> +OPENAL_SITE = $(call github,kcat,openal-soft,openal-soft-$(OPENAL_VERSION))
>  OPENAL_LICENSE = LGPL-2.0+
>  OPENAL_LICENSE_FILES = COPYING
>  OPENAL_INSTALL_STAGING = YES
> 

Note: The website we pulled from before had some issues recently, so let's pull from github.
And I didn't bumped the version because the newer one has some build issues I first need to check.
