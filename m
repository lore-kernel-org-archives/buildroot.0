From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jul 2019 16:10:45 +0200
Subject: [Buildroot] [PATCH 1/2] package/atk: fix build with NLS
In-Reply-To: <20190702195914.3682-1-fontaine.fabrice@gmail.com>
References: <20190702195914.3682-1-fontaine.fabrice@gmail.com>
Message-ID: <f85229b6-6ae6-8a2d-6458-5bfb9404b685@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/07/2019 21:59, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/67367706de3b38f31b9f59a7cb98cb2186e8ee6b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Both applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/atk/atk.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/atk/atk.mk b/package/atk/atk.mk
> index 228b24a7da..6a0cb370db 100644
> --- a/package/atk/atk.mk
> +++ b/package/atk/atk.mk
> @@ -11,6 +11,8 @@ ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
>  ATK_LICENSE = LGPL-2.0+
>  ATK_LICENSE_FILES = COPYING
>  ATK_INSTALL_STAGING = YES
> -ATK_DEPENDENCIES = libglib2
> +ATK_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
> +
> +ATK_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
>  
>  $(eval $(meson-package))
> 
