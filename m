From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 27 Oct 2012 23:20:56 +0200
Subject: [Buildroot] [PATCHv2] gnutls: fix link-time build failures
In-Reply-To: <1351117215-4614-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 24 Oct 2012 19:20:15 -0300")
References: <1351117215-4614-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ehkjk3wn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fixes
 Gustavo> http://autobuild.buildroot.net/results/23da17446266bdd49ea0da0c1892d66d3ac6607f/build-end.log
 Gustavo> And may the <BEEP> rest in peace at last...

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/gnutls/gnutls.mk |    3 ++-
 Gustavo>  1 files changed, 2 insertions(+), 1 deletions(-)

 Gustavo> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
 Gustavo> index e889821..1ef6e3f 100644
 Gustavo> --- a/package/gnutls/gnutls.mk
 Gustavo> +++ b/package/gnutls/gnutls.mk
 Gustavo> @@ -10,8 +10,9 @@ GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
 Gustavo>  GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
 Gustavo>  GNUTLS_LICENSE_FILES = COPYING lib/COPYING
 Gustavo>  GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt $(if $(BR2_PACKAGE_ZLIB),zlib)
 Gustavo> +GNUTLS_CONF_ENV = acl_cv_rpath=no
 Gustavo>  GNUTLS_CONF_OPT = --with-libgcrypt --without-libgcrypt-prefix \
 Gustavo> -		--without-p11-kit
 Gustavo> +		--without-p11-kit --disable-rpath

It's a bit odd that you need both the variable and the configure
options, but OK - You presumably do.

Committed, thanks.

-- 
Bye, Peter Korsgaard
