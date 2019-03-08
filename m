From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 8 Mar 2019 23:41:12 +0100
Subject: [Buildroot] [PATCH 1/1] Changed download links for libxml2 and
 libxslt
In-Reply-To: <CAJSYY8e8_uGy5ELd7JpLpVitw-rG3WogxhxhUQxRzVNndfnECw@mail.gmail.com>
References: <CAJSYY8e8_uGy5ELd7JpLpVitw-rG3WogxhxhUQxRzVNndfnECw@mail.gmail.com>
Message-ID: <20190308234112.2128603a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nityananda,

On Fri, 8 Mar 2019 15:46:44 +0530, Nityananda Padhan <ntneitin@gmail.com> wrote:

> Those ftp links were unreachable. After those changes it worked.
> 

Thanks for the patch, but the ftp download here works fine (as does the http one)...,
maybe a problem at your company network/proxy?

Yes, http works under more circumstances...

> 
> Thanks
> Neitin Nt

Please send the patch inline (and not as attachment), see [1] for details...

> From 80548bd6111d9f8f8c60c12a643cbf7088342e11 Mon Sep 17 00:00:00 2001
> From: Nt Neitin <ntneitin@gmail.com>
> Date: Fri, 8 Mar 2019 15:22:29 +0530
> Subject: [PATCH 1/1] Changed download links for libxml2 and libxslt

Should be:

  package/libxml2: change download site to http

and

  package/libxslt: change download site to http

and only one change per patch....

> 
>  Changes to be committed:
> 	modified:   package/libxml2/libxml2.mk
> 	modified:   package/libxslt/libxslt.mk
> 
> Signed-off-by: Nt Neitin <ntneitin@gmail.com>

Signed of should be 'Signed-off-by: Your Real Name <your@email.address>',
in your case 'Nityananda Padhan <ntneitin@gmail.com>'?

Regards,
Peter

[1] https://buildroot.org/downloads/manual/manual.html#submitting-patches

> ---
>  package/libxml2/libxml2.mk | 2 +-
>  package/libxslt/libxslt.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 3b3714fff1..f4b4de090e 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
> >  
>  LIBXML2_VERSION = 2.9.9
> -LIBXML2_SITE = ftp://xmlsoft.org/libxml2
> +LIBXML2_SITE = http://xmlsoft.org/sources
>  LIBXML2_INSTALL_STAGING = YES
>  LIBXML2_LICENSE = MIT
>  LIBXML2_LICENSE_FILES = COPYING
> diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
> index 5b1c0ae268..4632301b16 100644
> --- a/package/libxslt/libxslt.mk
> +++ b/package/libxslt/libxslt.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBXSLT_VERSION = 1.1.32
> -LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
> +LIBXSLT_SITE = http://xmlsoft.org/sources
>  LIBXSLT_INSTALL_STAGING = YES
>  LIBXSLT_LICENSE = MIT
>  LIBXSLT_LICENSE_FILES = COPYING
> -- 
> 2.17.1
