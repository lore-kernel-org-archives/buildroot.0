From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Sep 2011 12:09:50 +0200
Subject: [Buildroot] [PATCH] libsoup: add option to enable HTTPS (SSL)
	support
In-Reply-To: <1313056661-6090-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Thu, 11 Aug 2011 11:57:41 +0200")
References: <1313056661-6090-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <874o0q9e35.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> By selecting BR2_PACKAGE_LIBSOUP_SSL the gnutls package is selected
 Sven> and libsoup will be compiled with SSL support.

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  package/libsoup/Config.in  |    7 +++++++
 Sven>  package/libsoup/libsoup.mk |    8 +++++++-
 Sven>  2 files changed, 14 insertions(+), 1 deletions(-)

 Sven> diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
 
 Sven> +ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 Sven> +LIBSOUP_DEPENDENCIES += gnutls
 Sven> +LIBSOUP_CONF_OPT += --enable-ssl --without-libgcrypt-prefix

Why --without? It seems I need to pass
--with-libgrcypt-prefix=$(STAGING_DIR)/usr for configure to find
libgcrypt-config in staging.

Committed with that change, thanks.

-- 
Bye, Peter Korsgaard
