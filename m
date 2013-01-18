From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Jan 2013 12:51:41 +0100
Subject: [Buildroot] [PATCH 2/2] cairo: add missing dependency on
	xlib_libXext
In-Reply-To: <1358459850-15495-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 17 Jan 2013 22:57:30 +0100")
References: <1358459850-15495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358459850-15495-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y5fqiu9e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The X.org backend of Cairo now requires xlib_libXext. See
 Thomas> http://permalink.gmane.org/gmane.comp.lib.cairo/23385.

 Thomas> Fixes:

 Thomas>  http://autobuild.buildroot.org/results/795404665ec74a7ac929fdf8caf1397c9c54d80d/build-end.log

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/cairo/cairo.mk |    2 +-
 Thomas>  1 file changed, 1 insertion(+), 1 deletion(-)

 Thomas> diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
 Thomas> index ab0615c..83c82c0 100644
 Thomas> --- a/package/cairo/cairo.mk
 Thomas> +++ b/package/cairo/cairo.mk
 Thomas> @@ -51,7 +51,7 @@ endif
 
 Thomas>  ifeq ($(BR2_PACKAGE_XORG7),y)
 Thomas>  	CAIRO_CONF_OPT += --enable-xlib --enable-xcb --with-x
 Thomas> -	CAIRO_DEPENDENCIES += xlib_libX11
 Thomas> +	CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext

You should also select it in Config.in then.

-- 
Bye, Peter Korsgaard
