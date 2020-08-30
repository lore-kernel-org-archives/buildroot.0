From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Aug 2020 20:34:06 +0200
Subject: [Buildroot] [PATCH 1/3] package/libupnp18: security bump to
 version 1.14.0
In-Reply-To: <20200821204139.3682940-1-fontaine.fabrice@gmail.com>
References: <20200821204139.3682940-1-fontaine.fabrice@gmail.com>
Message-ID: <ee168046-5a2e-537c-8df2-9c4fd00bb757@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/08/2020 22:41, Fabrice Fontaine wrote:
> Fix CallStranger a.k.a. CVE-2020-12695 as well as CVE-2020-13848

 Again, although this bump indeed fixes those issues, it's a feature version
bump so I'm not sure if it can be called "security bump".

 In addition, the libupnp18 package exists because of API incompatibility with
1.6. Are we sure that this problem doesn't repeat itself for 1.14?

 Regards,
 Arnout

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libupnp18/libupnp18.hash | 6 +++---
>  package/libupnp18/libupnp18.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libupnp18/libupnp18.hash b/package/libupnp18/libupnp18.hash
> index ba9ce1bcdf..cd693ef0eb 100644
> --- a/package/libupnp18/libupnp18.hash
> +++ b/package/libupnp18/libupnp18.hash
> @@ -1,5 +1,5 @@
> -# From https://sourceforge.net/projects/pupnp/files/pupnp/libupnp-1.8.7/libupnp-1.8.7.tar.bz2.sha1
> -sha1  2ea3011180c58b0584f0cb73cc8e685a0a1c4ec8  libupnp-1.8.7.tar.bz2
> +# From https://sourceforge.net/projects/pupnp/files/pupnp/libupnp-1.14.0/libupnp-1.14.0.tar.bz2.sha1
> +sha1  b14cff9ddd7cfe7f0e4bf552387122a31770f51f  libupnp-1.14.0.tar.bz2
>  # Locally computed:
> -sha256  e38c69b2b67322e67cd53680db9b02c7c1f720a47a3cd626fd89d57d2dca93b8  libupnp-1.8.7.tar.bz2
> +sha256  ecb23d4291968c8a7bdd4eb16fc2250dbacc16b354345a13342d67f571d35ceb  libupnp-1.14.0.tar.bz2
>  sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
> diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
> index f17a1a720d..fb6c548c47 100644
> --- a/package/libupnp18/libupnp18.mk
> +++ b/package/libupnp18/libupnp18.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBUPNP18_VERSION = 1.8.7
> +LIBUPNP18_VERSION = 1.14.0
>  LIBUPNP18_SOURCE = libupnp-$(LIBUPNP18_VERSION).tar.bz2
>  LIBUPNP18_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libupnp-$(LIBUPNP18_VERSION)
>  LIBUPNP18_CONF_ENV = ac_cv_lib_compat_ftime=no
> 
