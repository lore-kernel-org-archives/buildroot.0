From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jan 2013 13:53:11 +0100
Subject: [Buildroot] [PATCH 1/1] New package GNU SASL Library - libgsasl
In-Reply-To: <1358080094-13890-1-git-send-email-sagaert.johan@skynet.be>
References: <1358080094-13890-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20130113135311.01b2bcce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 13 Jan 2013 13:28:14 +0100, Sagaert Johan wrote:
> GNU SASL is an implementation of the Simple Authentication and Security Layer framework
> and a few common SASL mechanisms.
> SASL is used by network servers (e.g., IMAP, SMTP) to request authentication from clients,
> and in clients to authenticate against servers.

Please copy those details to the help text of the package.

> libgsasl will be used in future versions of libesmtp
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  package/Config.in            |  1 +
>  package/libgsasl/Config.in   |  6 ++++++
>  package/libgsasl/libgsasl.mk | 14 ++++++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 package/libgsasl/Config.in
>  create mode 100644 package/libgsasl/libgsasl.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index fcc2480..427b4db 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -481,6 +481,7 @@ source "package/libdnet/Config.in"
>  source "package/libesmtp/Config.in"
>  source "package/libeXosip2/Config.in"
>  source "package/libfcgi/Config.in"
> +source "package/libgsasl/Config.in"
>  source "package/libidn/Config.in"
>  source "package/libiscsi/Config.in"
>  source "package/liboauth/Config.in"
> diff --git a/package/libgsasl/Config.in b/package/libgsasl/Config.in
> new file mode 100644
> index 0000000..2b5e664
> --- /dev/null
> +++ b/package/libgsasl/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBGSASL
> +	bool "libgsasl"
> +	help
> +	  Simple Authentication and Security Layer framework Library.
> +
> +	  http://www.gnu.org/software/gsasl
> diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
> new file mode 100644
> index 0000000..9bc0cc6
> --- /dev/null
> +++ b/package/libgsasl/libgsasl.mk
> @@ -0,0 +1,14 @@
> +#############################################################
> +#
> +# libgsasl
> +#
> +#############################################################
> +LIBGSASL_VERSION = 1.8.0
> +LIBGSASL_SOURCE = libgsasl-$(LIBGSASL_VERSION).tar.gz
> +LIBGSASL_SITE = ftp://ftp.gnu.org/gnu/gsasl
> +LIBGSASL_LICENSE = GPLv2+
> +LIBGSASL_LICENSE_FILES = COPYING

No, the license is not GPLv2. See the README file:

==
The GNU SASL Library is licensed under the GNU Lesser General Public
License (LGPL) version 2.1 (or later).  See the file COPYING.LIB.  The
GNU project typically uses the GNU General Public License (GPL) for
libraries, and not the LGPL, but for this project we decided that we
would get more help from the community if we used the LGPLv2.1+, as
other free SASL implementations exists.  See also
<http://www.gnu.org/licenses/why-not-lgpl.html>.

Some parts, such as the gnulib self-tests (gltests/) are licensed
under the GNU General Public License (GPL) version 3.0 (or later).
See the file COPYING.
==

So, probably, it should be something like:

LIBGSASL_LICENSE = LGPLv2.1+ (library), GPLv3+ (programs)
LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING

I'm suggesting to also copy the README file in addition to the license
files themselves, because the README explains how the different
licenses apply to the different parts of libgasl.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
