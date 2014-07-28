From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Jul 2014 23:28:50 +0200
Subject: [Buildroot] [git commit] flickcurl: remove ca-certificates as a
	build dependency
In-Reply-To: <20140728212604.140519D2EE@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 28 Jul 2014 23:25:20 +0200")
References: <20140728212604.140519D2EE@busybox.osuosl.org>
Message-ID: <87zjft8965.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: http://git.buildroot.net/buildroot/commit/?id=58441cfd482813a7d7610d2c87dd94bc385795a0
 > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > ca-certificates is a runtime dependency only, so selecting it in the
 > Config.in file is sufficient, adding it to FLICKCURL_DEPENDENCIES is
 > not useful.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/flickcurl/flickcurl.mk |    2 +-
 >  1 files changed, 1 insertions(+), 1 deletions(-)

 > diff --git a/package/flickcurl/flickcurl.mk b/package/flickcurl/flickcurl.mk
 > index 7fb212f..67e8851 100644
 > --- a/package/flickcurl/flickcurl.mk
 > +++ b/package/flickcurl/flickcurl.mk
 > @@ -11,7 +11,7 @@ FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
 >  FLICKCURL_INSTALL_STAGING = YES
 >  FLICKCURL_CONFIG_SCRIPTS = flickcurl-config
 >  FLICKCURL_CONF_OPT = --without-curl-config --without-xml2-config --without-raptor
 > -FLICKCURL_DEPENDENCIES = libcurl libxml2 openssl ca-certificates host-pkgconf
 > +FLICKCURL_DEPENDENCIES = libcurl libxml2 openssl host-pkgconf

Please also drop openssl.

-- 
Bye, Peter Korsgaard
