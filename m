From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Jan 2012 23:05:47 +0100
Subject: [Buildroot] [PATCH 05/14] libeet: Add new package
In-Reply-To: <CAFbHwiQuZ8aWRAFBF50d_3FF3Pz-ZSAADFiK0O2SY-2agQcySg@mail.gmail.com>
 (Will Newton's message of "Thu, 26 Jan 2012 17:42:29 +0000")
References: <CAFbHwiQuZ8aWRAFBF50d_3FF3Pz-ZSAADFiK0O2SY-2agQcySg@mail.gmail.com>
Message-ID: <87liouce6c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Will> ---
 Will>  package/efl/Config.in        |    1 +
 Will>  package/efl/libeet/Config.in |    9 +++++++++
 Will>  package/efl/libeet/libeet.mk |   16 ++++++++++++++++
 Will>  3 files changed, 26 insertions(+), 0 deletions(-)
 Will>  create mode 100644 package/efl/libeet/Config.in
 Will>  create mode 100644 package/efl/libeet/libeet.mk

 Will> diff --git a/package/efl/Config.in b/package/efl/Config.in
 Will> index cc677cb..8ca514d 100644
 Will> --- a/package/efl/Config.in
 Will> +++ b/package/efl/Config.in
 Will> @@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_EFL
 Will>  if BR2_PACKAGE_EFL

 Will>  source "package/efl/libeina/Config.in"
 Will> +source "package/efl/libeet/Config.in"

 Will>  endif # BR2_PACKAGE_EFL

 Will> diff --git a/package/efl/libeet/Config.in b/package/efl/libeet/Config.in
 Will> new file mode 100644
 Will> index 0000000..fa1dd2a
 Will> --- /dev/null
 Will> +++ b/package/efl/libeet/Config.in
 Will> @@ -0,0 +1,9 @@
 Will> +config BR2_PACKAGE_LIBEET
 Will> +	bool "libeet"
 Will> +	select BR2_PACKAGE_ZLIB
 Will> +	select BR2_PACKAGE_JPEG
 Will> +	select BR2_PACKAGE_LIBEINA
 Will> +	help
 Will> +	  Eet is a tiny library designed to write an arbitary set of
 Will> +	  chunks of data to a file and optionally compress each chunk
 Will> +	  (very much like a zip file).

Again missing upstream URL.


 Will> diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
 Will> new file mode 100644
 Will> index 0000000..bcea73e
 Will> --- /dev/null
 Will> +++ b/package/efl/libeet/libeet.mk
 Will> @@ -0,0 +1,16 @@
 Will> +#############################################################
 Will> +#
 Will> +# libeet
 Will> +#
 Will> +#############################################################
 Will> +
 Will> +LIBEET_VERSION = 1.5.0
 Will> +LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
 Will> +LIBEET_SITE = http://download.enlightenment.org/releases/
 Will> +LIBEET_INSTALL_STAGING = YES
 Will> +LIBEET_INSTALL_TARGET = YES

INSTALL_TARGET defaults to YES, so that can be removed. I've fixed up
those 2 minor issues and committed, thanks.

-- 
Bye, Peter Korsgaard
