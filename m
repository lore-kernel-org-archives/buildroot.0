From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jul 2019 21:58:54 +0200
Subject: [Buildroot] [PATCH 1/2] package/json-glib: fix NLS build
In-Reply-To: <20190702061113.24985-1-fontaine.fabrice@gmail.com>
References: <20190702061113.24985-1-fontaine.fabrice@gmail.com>
Message-ID: <b07aaa0d-d8bb-3a30-b929-38f1dde1d4c7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/07/2019 08:11, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/a9515ce8acb2d13532d0d43f8f61fa890a4705b3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/json-glib/json-glib.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
> index 77c0c45323..2d4adb2adb 100644
> --- a/package/json-glib/json-glib.mk
> +++ b/package/json-glib/json-glib.mk
> @@ -12,6 +12,8 @@ JSON_GLIB_LICENSE = LGPL-2.1+
>  JSON_GLIB_LICENSE_FILES = COPYING
>  JSON_GLIB_INSTALL_STAGING = YES
>  
> +JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

 We typically put LDFLAGS etc. after DEPENDENCIES, so I changed that and applied
both to master, thanks.

 Regards,
 Arnout

> +
>  JSON_GLIB_DEPENDENCIES = \
>  	$(TARGET_NLS_DEPENDENCIES) \
>  	host-pkgconf \
> 
