From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 Mar 2012 13:33:08 +0100
Subject: [Buildroot] [PATCH] Added the libtpl package
In-Reply-To: <1332152635-26299-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 19 Mar 2012 10:23:55 +0000")
References: <1332152635-26299-1-git-send-email-spdawson@gmail.com>
Message-ID: <87zkbcixdn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/Config.in        |    1 +
 spdawson>  package/libtpl/Config.in |    6 ++++++
 spdawson>  package/libtpl/libtpl.mk |   14 ++++++++++++++
 spdawson>  3 files changed, 21 insertions(+), 0 deletions(-)
 spdawson>  create mode 100644 package/libtpl/Config.in
 spdawson>  create mode 100644 package/libtpl/libtpl.mk

 spdawson> +++ b/package/libtpl/libtpl.mk
 spdawson> @@ -0,0 +1,14 @@
 spdawson> +#############################################################
 spdawson> +#
 spdawson> +# libtpl
 spdawson> +#
 spdawson> +#############################################################
 spdawson> +LIBTPL_VERSION = 1.5
 spdawson> +LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
 spdawson> +LIBTPL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tpl
 spdawson> +
 spdawson> +# N.B. A static library is built, so don't install to target
 spdawson> +LIBTPL_INSTALL_STAGING = YES
 spdawson> +LIBTPL_INSTALL_TARGET = NO

Ehh, how did you get that idea?

make -C output/build/libtpl-1.5 DESTDIR=$PWD/out install
tree out
out
??? usr
    ??? include
    ??? ??? tpl.h
    ??? lib
        ??? libtpl.a
        ??? libtpl.la
        ??? libtpl.so -> libtpl.so.0.0.0
        ??? libtpl.so.0 -> libtpl.so.0.0.0
        ??? libtpl.so.0.0.0

Committed without the _INSTALL_TARGET = NO, thanks.

-- 
Bye, Peter Korsgaard
