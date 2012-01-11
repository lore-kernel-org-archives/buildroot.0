From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jan 2012 18:22:44 +0100
Subject: [Buildroot] [PATCH] tiff: add utility commands and library
	options
In-Reply-To: <1326084271-12749-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Sun, 8 Jan 2012 23:44:31 -0500")
References: <1326084271-12749-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87d3aq9msb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 Frank> Added support for compiling tiffcp and tiff2pdf.
 Frank> Added options for compiling out various libtiff features. By default,
 Frank> all libtiff features are built so that the result is the same as before
 Frank> this change.

 Frank> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 Frank> ---
 Frank>  package/tiff/Config.in |   75 ++++++++++++++++++++++++++++++++++++++++++++++-
 Frank>  package/tiff/tiff.mk   |   70 ++++++++++++++++++++++++++++++++++++++++++++-
 Frank>  2 files changed, 142 insertions(+), 3 deletions(-)

 Frank> diff --git a/package/tiff/Config.in b/package/tiff/Config.in
 Frank> index c6336e2..007b37d 100644
 Frank> --- a/package/tiff/Config.in
 Frank> +++ b/package/tiff/Config.in
 Frank> @@ -1,8 +1,79 @@
 Frank>  config BR2_PACKAGE_TIFF
 Frank>  	bool "tiff"
 Frank> -	select BR2_PACKAGE_ZLIB
 Frank> -	select BR2_PACKAGE_JPEG
 Frank>  	help
 Frank>  	  Library for handling TIFF (Tag Image File Format) images.
 
 Frank>  	  http://www.libtiff.org/
 Frank> +
 Frank> +if BR2_PACKAGE_TIFF
 Frank> +menu "tiff Options"
 Frank> +
 Frank> +config BR2_PACKAGE_TIFF_LARGE_FILE
 Frank> +        bool "Large file support"
 Frank> +	default y

Need to indent with <tab>.

How is this related to the global BR2_LARGEFILE setting? We already pass
--disable-largefile for !BR2_LARGEFILE builds (see package/Makefile.in).

Otherwise it looks good.

-- 
Bye, Peter Korsgaard
