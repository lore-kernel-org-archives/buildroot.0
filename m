From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 22:36:22 +0100
Subject: [Buildroot] [PATCH 1/1] php: security bump to 7.3.1
In-Reply-To: <20190119212934.85216-1-aduskett@gmail.com> (aduskett@gmail.com's
 message of "Sat, 19 Jan 2019 16:29:34 -0500")
References: <20190119212934.85216-1-aduskett@gmail.com>
Message-ID: <87imyk1ga1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Fixes the following security issue:

 > - CVE-2018-19935: Allows remote attackers to cause a denial of service
 >   (NULL pointer dereference and application crash) via an empty string in the
 >   message argument to the imap_mail function.
 > https://www.cvedetails.com/cve/CVE-2018-19935/

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 > ---
 >  package/php/php.hash | 2 +-
 >  package/php/php.mk   | 8 ++++----
 >  2 files changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/package/php/php.hash b/package/php/php.hash
 > index c1c6e8c3e9..2cb89e0366 100644
 > --- a/package/php/php.hash
 > +++ b/package/php/php.hash
 > @@ -1,5 +1,5 @@
 >  # From http://php.net/downloads.php
 > -sha256 7d195cad55af8b288c3919c67023a14ff870a73e3acc2165a6d17a4850a560b5  php-7.3.0.tar.xz
 > +sha256 cfe93e40be0350cd53c4a579f52fe5d8faf9c6db047f650a4566a2276bf33362  php-7.3.1.tar.xz
 
 >  # License file
 >  sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
 > diff --git a/package/php/php.mk b/package/php/php.mk
 > index 7d7d78353b..be7e9b3c89 100644
 > --- a/package/php/php.mk
 > +++ b/package/php/php.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -PHP_VERSION = 7.3.0
 > +PHP_VERSION = 7.3.1
 >  PHP_SITE = http://www.php.net/distributions
 >  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 >  PHP_INSTALL_STAGING = YES
 > @@ -243,9 +243,9 @@ endef
 >  PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
 
 >  ### Use external PCRE if it's available
 > -ifeq ($(BR2_PACKAGE_PCRE),y)
 > -PHP_CONF_OPTS += --with-pcre-regex
 > -PHP_DEPENDENCIES += pcre
 > +ifeq ($(BR2_PACKAGE_PCRE2),y)
 > +PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
 > +PHP_DEPENDENCIES += pcre2

The pcre2 changes should not be part of the version bump. Committed with
that dropped, thanks.

-- 
Bye, Peter Korsgaard
