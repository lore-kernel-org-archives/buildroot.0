From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jul 2014 23:15:54 +0200
Subject: [Buildroot] [PATCH 2/2] flickcurl: new package
In-Reply-To: <c00ebca71aec2bc2434dc90f3b249c2519158323.1406581025.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 28 Jul 2014 22:58:08 +0200")
References: <cover.1406581025.git.yann.morin.1998@free.fr>
 <c00ebca71aec2bc2434dc90f3b249c2519158323.1406581025.git.yann.morin.1998@free.fr>
Message-ID: <878und9oc5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Peter Korsgaard <peter@korsgaard.com>
 > We need two patches from upstream git as flickr now requires https access.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > [yann.morin.1998 at free.fr: fix the kconfig recursive loop when selecting
 >  a SSL implementation]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks! One minor issue:

 > +++ b/package/flickcurl/flickcurl.mk
 > @@ -0,0 +1,23 @@
 > +################################################################################
 > +#
 > +# flickcurl
 > +#
 > +################################################################################
 > +
 > +FLICKCURL_VERSION = 1.25
 > +FLICKCURL_SITE = http://download.dajobe.org/flickcurl/
 > +FLICKCURL_LICENSE = LGPLv2.1+ or GPLv2+ or Apache 2.0+
 > +FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
 > +FLICKCURL_INSTALL_STAGING = YES
 > +FLICKCURL_CONFIG_SCRIPTS = flickcurl-config
 > +FLICKCURL_CONF_OPT = --without-curl-config --without-xml2-config --without-raptor
 > +FLICKCURL_DEPENDENCIES = libcurl libxml2 openssl ca-certificates host-pkgconf

You should no longer unconditionally add openssl to the dependencies. As
the ordering is taken care of by libcurl we can simply remove any of the
ssl libraries here.

Looking at it again, we can actually also remove ca-certificates as it
is only a runtime dependency.

-- 
Bye, Peter Korsgaard 
