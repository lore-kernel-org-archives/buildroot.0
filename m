From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 21:28:39 +0100
Subject: [Buildroot] [PATCH 2/3] libmcrypt: new package
In-Reply-To: <1357582380-22332-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 7 Jan 2013 15:12:59 -0300")
References: <1357582380-22332-1-git-send-email-gustavo@zacarias.com.ar>
 <1357582380-22332-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87libwx1xk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/Config.in                       |    1 +
 Gustavo>  package/libmcrypt/Config.in             |    7 +++++++
 Gustavo>  package/libmcrypt/libmcrypt-nocxx.patch |   15 +++++++++++++++
 Gustavo>  package/libmcrypt/libmcrypt.mk          |   21 +++++++++++++++++++++
 Gustavo>  4 files changed, 44 insertions(+), 0 deletions(-)
 Gustavo>  create mode 100644 package/libmcrypt/Config.in
 Gustavo>  create mode 100644 package/libmcrypt/libmcrypt-nocxx.patch
 Gustavo>  create mode 100644 package/libmcrypt/libmcrypt.mk

 Gustavo> +++ b/package/libmcrypt/libmcrypt.mk
 Gustavo> @@ -0,0 +1,21 @@
 Gustavo> +#############################################################
 Gustavo> +#
 Gustavo> +# libmcrypt
 Gustavo> +#
 Gustavo> +#############################################################
 Gustavo> +
 Gustavo> +LIBMCRYPT_VERSION = 2.5.8
 Gustavo> +LIBMCRYPT_SITE = http://downloads.sourceforge.net/project/mcrypt/Libmcrypt/$(LIBMCRYPT_VERSION)
 Gustavo> +LIBMCRYPT_AUTORECONF = YES
 Gustavo> +LIBMCRYPT_INSTALL_STAGING = YES
 Gustavo> +LIBMCRYPT_LICENSE = LGPLv2.1
 Gustavo> +LIBMCRYPT_LICENSE_FILES = COPYING.LIB
 Gustavo> +
 Gustavo> +define LIBMCRYPT_STAGING_LIBMCRYPT_CONFIG_FIXUP
 Gustavo> +	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/libmcrypt-config
 Gustavo> +	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/libmcrypt-config

I rewrote this to change both in a single sed invocation similar to
other scripts and committed, thanks.

-- 
Bye, Peter Korsgaard
