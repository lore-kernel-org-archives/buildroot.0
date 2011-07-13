From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Jul 2011 19:16:57 +0200
Subject: [Buildroot] [PATCH] gnutls: update to version 2.10.3
In-Reply-To: <1310576758-9980-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Wed, 13 Jul 2011 19:05:58 +0200")
References: <1310576758-9980-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87k4bmdrsm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Update gnutls to the latest release that still uses libgcrypt.
 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  package/gnutls/gnutls.mk |    5 +++--
 Sven>  1 files changed, 3 insertions(+), 2 deletions(-)

 Sven> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
 Sven> index 5f31e1e..b62ed3c 100644
 Sven> --- a/package/gnutls/gnutls.mk
 Sven> +++ b/package/gnutls/gnutls.mk
 Sven> @@ -4,11 +4,12 @@
 Sven>  #
 Sven>  #############################################################
 
 Sven> -GNUTLS_VERSION = 2.8.6
 Sven> +GNUTLS_VERSION = 2.10.3
 Sven>  GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 Sven>  GNUTLS_SITE = http://ftp.gnu.org/gnu/gnutls/
 Sven> -GNUTLS_DEPENDENCIES = libgcrypt
 Sven>  GNUTLS_CONF_OPT += --without-libgcrypt-prefix
 Sven>  GNUTLS_INSTALL_STAGING = YES
 
 Sven> +GNUTLS_DEPENDENCIES = host-pkg-config libglib2 libgcrypt

So it depends on glib now? Then you should select it as well in
Config.in

-- 
Bye, Peter Korsgaard
