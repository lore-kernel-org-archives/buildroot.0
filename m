From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 19:43:51 +0200
Subject: [Buildroot] [V4 2/3] libtomcrypt: new package
In-Reply-To: <1460300126-11046-2-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Sun, 10 Apr 2016 16:55:25 +0200")
References: <1460300126-11046-1-git-send-email-francois.perrad@gadz.org>
 <1460300126-11046-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <87bn4ty6g8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  package/Config.in                    |  1 +
 >  package/libtomcrypt/Config.in        | 11 +++++++++++
 >  package/libtomcrypt/libtomcrypt.hash |  2 ++
 >  package/libtomcrypt/libtomcrypt.mk   | 24 ++++++++++++++++++++++++
 >  4 files changed, 38 insertions(+)
 >  create mode 100644 package/libtomcrypt/Config.in
 >  create mode 100644 package/libtomcrypt/libtomcrypt.hash
 >  create mode 100644 package/libtomcrypt/libtomcrypt.mk

 > +++ b/package/libtomcrypt/libtomcrypt.mk
 > @@ -0,0 +1,24 @@
 > +################################################################################
 > +#
 > +# libtomcrypt
 > +#
 > +################################################################################
 > +
 > +LIBTOMCRYPT_VERSION = 1.17
 > +LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/$(LIBTOMCRYPT_VERSION)
 > +LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.bz2
 > +LIBTOMCRYPT_LICENSE = WTFPL
 > +LIBTOMCRYPT_LICENSE_FILES = LICENSE
 > +LIBTOMCRYPT_INSTALL_STAGING = YES
 > +LIBTOMCRYPT_INSTALL_TARGET = NO # only static library
 > +LIBTOMCRYPT_DEPENDENCIES = libtommath
 > +
 > +define LIBTOMCRYPT_BUILD_CMDS
 > +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./src/headers $(TARGET_CFLAGS) -DLTC_SOURCE -DLTM_DESC"

We also need to pass -DLTC_NO_WCHAR when the toolchain doesn't have
wchar support. Committed with that fixed, thanks!

-- 
Bye, Peter Korsgaard
