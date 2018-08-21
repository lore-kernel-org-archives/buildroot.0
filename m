From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 21 Aug 2018 20:52:45 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/luvi: bump version to 2.8.0
In-Reply-To: <20180819120219.28721-1-bernd.kuhls@t-online.de>
References: <20180819120219.28721-1-bernd.kuhls@t-online.de>
Message-ID: <3c2105ff5b2fb60820f63e1d7851ddda2ec48355.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, 2018-08-19 at 14:02 +0200, Bernd Kuhls wrote:
> Upstream does not provide a tarball including all submodules so we need
> to checkout the git repo including the submodules ourselves.
> 
> Added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/luvi/luvi.hash | 3 ++-
>  package/luvi/luvi.mk   | 7 ++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
> index e2239b6171..d5716e0036 100644
> --- a/package/luvi/luvi.hash
> +++ b/package/luvi/luvi.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
> -sha256  ce9a1fb762e61267618ddea9ea129170fd543bb918c382b71cb35985d0024c42  luvi-src-v2.7.6.tar.gz
> +sha256 a18e138c7032ef8406fef6e2135a61fad713861742512f2073adc0b4ab6d8f8b  luvi-v2.8.0.tar.gz
> +sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
> diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
> index a2bc218e77..8b3b7659b0 100644
> --- a/package/luvi/luvi.mk
> +++ b/package/luvi/luvi.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -LUVI_VERSION = v2.7.6
> -LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
> -LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
> +LUVI_VERSION = v2.8.0
> +LUVI_SITE = https://github.com/luvit/luvi.git
> +LUVI_SITE_METHOD = git
> +LUVI_GIT_SUBMODULES = YES
>  LUVI_LICENSE = Apache-2.0
>  LUVI_LICENSE_FILES = LICENSE.txt
>  LUVI_DEPENDENCIES = libuv luajit luv host-luajit

I am not so happy about the version bump as version 2.8.0 does only
updates the projects submodules, which we are not using at all.
Instead, we always build luvi with dependencies provided as packages in
Buildroot.

Bumping to version 2.8.0 has the drawback that fetching the package
needs much longer now due to the git submodules than fetching the
tarball and building against the packages provided by Buildroot.

Best regards,
J?rg Krause
