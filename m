From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Apr 2013 22:36:47 +0200
Subject: [Buildroot] [PATCH 05/10] Config.in.legacy: adding renamed BR2
	Options
In-Reply-To: <1362940371-25899-6-git-send-email-c.schoenert@gmail.com>
 (Carsten Schoenert's message of "Sun, 10 Mar 2013 19:32:46 +0100")
References: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
 <1362940371-25899-6-git-send-email-c.schoenert@gmail.com>
Message-ID: <87vc764ckg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> Related to the changed directfb variables for
 Carsten> BR2_PACKAGE_DIRECTFB_DITHER_RGB16 and
 Carsten> BR2_PACKAGE_DIRECTFB_TESTS
 Carsten> adding a legacy check.

 Carsten> Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> ---
 Carsten>  Config.in.legacy |   18 ++++++++++++++++++
 Carsten>  1 file changed, 18 insertions(+)

 Carsten> diff --git a/Config.in.legacy b/Config.in.legacy
 Carsten> index d90132c..838e7fc 100644
 Carsten> --- a/Config.in.legacy
 Carsten> +++ b/Config.in.legacy
 Carsten> @@ -40,6 +40,24 @@ comment "As long as these options stay selected, the build   "
 Carsten>  comment "will fail.                                          "
 Carsten>  endif
 
 Carsten> +#
 Carsten> +# Legacy options since 2013.02
 Carsten> +#
 Carsten> +config BR2_PACKAGE_DIRECTB_DITHER_RGB16
 Carsten> +	bool "DirectFB RGB16 dithering option has been renamed"
 Carsten> +	select BR2_PACKAGE_DIRECTFB_DITHER_RGB16
 Carsten> +	select BR2_LEGACY
 Carsten> +	help
 Carsten> +	  The option has been renamed
 Carsten> +	  BR2_PACKAGE_DIRECTFB_DITHER_RGB16.
 Carsten> +
 Carsten> +config BR2_PACKAGE_DIRECTFB_TESTS

This should be BR2_PACKAGE_DIRECTB_TESTS. Fixed while committing.

 Carsten> +	bool "DirectFB Tests option has been renamed"
 Carsten> +	select BR2_PACKAGE_DIRECTFB_TESTS
 Carsten> +	select BR2_LEGACY
 Carsten> +	help
 Carsten> +	  The option has been renamed
 Carsten> +	  BR2_PACKAGE_DIRECTFB_TESTS.
 

-- 
Bye, Peter Korsgaard
