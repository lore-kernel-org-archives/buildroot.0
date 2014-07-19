From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 17:04:53 +0200
Subject: [Buildroot] [PATCH] package/libfcgi: do not build examples
In-Reply-To: <1405782180-28054-1-git-send-email-yann.morin.1998@free.fr>
References: <1405782180-28054-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140719150453.GI3593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-07-19 17:03 +0200, Yann E. MORIN spake thusly:
> Examples do not compile for a static build, because libtool forcibly
> wants to link against the shared version of libstdc++.so, instead of the
> static version.
> 
> Since we do not really need the examples on the target, just disable
> them, it is easier than fixing libtool.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/66e/66e19cfd5a6048d2aaa46365518ea875e0abcb4d/
>     http://autobuild.buildroot.org/results/71d/71d9ba50b41efa05a3aff06c24412d5e8b81d8f1/

I forgot to say that I rename the patches to have numbers.

Regards,
Yann E. MORIN.

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../{libfcgi-eof.patch => libfcgi-0000-eof.patch}   |  0
>  ...h => libfcgi-0001-link-against-libfcgi-la.patch} |  0
>  ...h.patch => libfcgi-0002-link-against-math.patch} |  0
>  ...patch => libfcgi-0003-make-autoreconfable.patch} |  0
>  package/libfcgi/libfcgi-0004-disable-examples.patch | 21 +++++++++++++++++++++
>  5 files changed, 21 insertions(+)
>  rename package/libfcgi/{libfcgi-eof.patch => libfcgi-0000-eof.patch} (100%)
>  rename package/libfcgi/{libfcgi-link-against-libfcgi-la.patch => libfcgi-0001-link-against-libfcgi-la.patch} (100%)
>  rename package/libfcgi/{libfcgi-link-against-math.patch => libfcgi-0002-link-against-math.patch} (100%)
>  rename package/libfcgi/{libfcgi-make-autoreconfable.patch => libfcgi-0003-make-autoreconfable.patch} (100%)
>  create mode 100644 package/libfcgi/libfcgi-0004-disable-examples.patch
> 
> diff --git a/package/libfcgi/libfcgi-eof.patch b/package/libfcgi/libfcgi-0000-eof.patch
> similarity index 100%
> rename from package/libfcgi/libfcgi-eof.patch
> rename to package/libfcgi/libfcgi-0000-eof.patch
> diff --git a/package/libfcgi/libfcgi-link-against-libfcgi-la.patch b/package/libfcgi/libfcgi-0001-link-against-libfcgi-la.patch
> similarity index 100%
> rename from package/libfcgi/libfcgi-link-against-libfcgi-la.patch
> rename to package/libfcgi/libfcgi-0001-link-against-libfcgi-la.patch
> diff --git a/package/libfcgi/libfcgi-link-against-math.patch b/package/libfcgi/libfcgi-0002-link-against-math.patch
> similarity index 100%
> rename from package/libfcgi/libfcgi-link-against-math.patch
> rename to package/libfcgi/libfcgi-0002-link-against-math.patch
> diff --git a/package/libfcgi/libfcgi-make-autoreconfable.patch b/package/libfcgi/libfcgi-0003-make-autoreconfable.patch
> similarity index 100%
> rename from package/libfcgi/libfcgi-make-autoreconfable.patch
> rename to package/libfcgi/libfcgi-0003-make-autoreconfable.patch
> diff --git a/package/libfcgi/libfcgi-0004-disable-examples.patch b/package/libfcgi/libfcgi-0004-disable-examples.patch
> new file mode 100644
> index 0000000..4a9916f
> --- /dev/null
> +++ b/package/libfcgi/libfcgi-0004-disable-examples.patch
> @@ -0,0 +1,21 @@
> +Common subdirectories: libfcgi-2.4.0.orig/cgi-fcgi and libfcgi-2.4.0/cgi-fcgi
> +Common subdirectories: libfcgi-2.4.0.orig/doc and libfcgi-2.4.0/doc
> +Common subdirectories: libfcgi-2.4.0.orig/examples and libfcgi-2.4.0/examples
> +Common subdirectories: libfcgi-2.4.0.orig/images and libfcgi-2.4.0/images
> +Common subdirectories: libfcgi-2.4.0.orig/include and libfcgi-2.4.0/include
> +Common subdirectories: libfcgi-2.4.0.orig/java and libfcgi-2.4.0/java
> +Common subdirectories: libfcgi-2.4.0.orig/libfcgi and libfcgi-2.4.0/libfcgi
> +diff -du libfcgi-2.4.0.orig/Makefile.am libfcgi-2.4.0/Makefile.am
> +--- libfcgi-2.4.0.orig/Makefile.am	2001-12-22 14:05:39.000000000 +0100
> ++++ libfcgi-2.4.0/Makefile.am	2014-07-19 16:56:21.935216540 +0200
> +@@ -4,7 +4,7 @@
> + #  $Id: Makefile.am,v 1.7 2001/12/22 13:05:39 robs Exp $
> + #
> + 
> +-SUBDIRS = libfcgi cgi-fcgi examples include
> ++SUBDIRS = libfcgi cgi-fcgi include
> + 
> + include_HEADERS = fcgi_config.h
> + 
> +Common subdirectories: libfcgi-2.4.0.orig/perl and libfcgi-2.4.0/perl
> +Common subdirectories: libfcgi-2.4.0.orig/Win32 and libfcgi-2.4.0/Win32
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
