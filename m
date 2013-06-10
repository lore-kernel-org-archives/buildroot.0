From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Jun 2013 14:35:17 +0200
Subject: [Buildroot] [PATCH v2] pulseaudio : bump to version 4.0
In-Reply-To: <1370850974-7849-1-git-send-email-jeremy.rosen@openwide.fr>
 (=?utf-8?B?IkrDqXLDqW15?= Rosen"'s message of "Mon, 10 Jun 2013 09:56:14
 +0200")
References: <1370850974-7849-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <87zjuy5eka.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?my" == J?r?my Rosen <jeremy.rosen@openwide.fr> writes:

 J?r?my> removes a patch that was integrated upstream
 J?r?my> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
 J?r?my> --
 J?r?my> v2 : add license information
 J?r?my>      remove dependency on gtk2 since upstream only supports gtk3
 J?r?my> ---
 J?r?my>  .../pulseaudio-compat-with-json-c-0.11.patch       |   26 --------------------
 J?r?my>  package/multimedia/pulseaudio/pulseaudio.mk        |   15 +++--------
 J?r?my>  2 files changed, 3 insertions(+), 38 deletions(-)
 J?r?my>  delete mode 100644 package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch

 J?r?my> diff --git a/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch b/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch
 J?r?my> deleted file mode 100644
 J?r?my> index 86efdfd..0000000
 J?r?my> --- a/package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch
 J?r?my> +++ /dev/null
 J?r?my> @@ -1,26 +0,0 @@
 J?r?my> -From 759c0bc6f990240287a14fa6dec029ecea581463 Mon Sep 17 00:00:00 2001
 J?r?my> -From: Arun Raghavan <arun.raghavan@collabora.co.uk>
 J?r?my> -Date: Sat, 27 Apr 2013 03:27:05 +0000
 J?r?my> -Subject: build-sys: json-c changed everything :(
 J?r?my> -
 J?r?my> -json-c 0.11 ships a pkg-config file with a different name, and changes
 J?r?my> -the name of its library as well.
 J?r?my> ----
 J?r?my> -(limited to 'configure.ac')
 J?r?my> -
 J?r?my> -diff --git a/configure.ac b/configure.ac
 J?r?my> -index c8161a4..b1bd21a 100644
 J?r?my> ---- a/configure.ac
 J?r?my> -+++ b/configure.ac
 J?r?my> -@@ -624,7 +624,8 @@ AM_CONDITIONAL([HAVE_TESTS], [test "x$HAVE_LIBCHECK" = x1])
 J?r?my> - 
 J?r?my> - #### json parsing ####
 J?r?my> - 
 J?r?my> --PKG_CHECK_MODULES(LIBJSON, [ json >= 0.9 ])
 J?r?my> -+PKG_CHECK_MODULES(LIBJSON, [ json-c >= 0.11 ], [],
 J?r?my> -+		  [PKG_CHECK_MODULES(LIBJSON, [ json >= 0.9 ])])
 J?r?my> - AC_SUBST(LIBJSON_CFLAGS)
 J?r?my> - AC_SUBST(LIBJSON_LIBS)
 J?r?my> - 
 J?r?my> ---
 J?r?my> -cgit v0.9.0.2-2-gbebe
 J?r?my> diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
 J?r?my> index c789fc8..24a4ef4 100644
 J?r?my> --- a/package/multimedia/pulseaudio/pulseaudio.mk
 J?r?my> +++ b/package/multimedia/pulseaudio/pulseaudio.mk
 J?r?my> @@ -4,9 +4,11 @@
 J?r?my>  #
 J?r?my>  ################################################################################
 
 J?r?my> -PULSEAUDIO_VERSION = 3.0
 J?r?my> +PULSEAUDIO_VERSION = 4.0
 J?r?my>  PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases/
 J?r?my>  PULSEAUDIO_INSTALL_STAGING = YES
 J?r?my> +PULSEAUDIO_LICENSE = LGPLv2.1+ (specific license for modules, see LICENSE file)
 J?r?my> +PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL 

You have a trailing space here. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
