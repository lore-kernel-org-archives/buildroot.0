From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 17:20:58 +0100
Subject: [Buildroot] [PATCH v1] freetype: bump version to 2.9.1
In-Reply-To: <20181128191517.24636-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Wed, 28 Nov 2018 20:15:17 +0100")
References: <20181128191517.24636-1-ps.report@gmx.net>
Message-ID: <87o9a77t3p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > According to [1]:
 > - fixes CVE-2018-6942

It is always great to add a short description what this is about. I've
added:

A NULL pointer dereference in the Ins_GETVARIATION() function within
ttinterp.c could lead to DoS via a crafted font file.

(from https://security-tracker.debian.org/tracker/CVE-2018-6942)


> --- a/package/freetype/freetype.mk
 > +++ b/package/freetype/freetype.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -FREETYPE_VERSION = 2.9
 > +FREETYPE_VERSION = 2.9.1
 >  FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 >  FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 >  FREETYPE_INSTALL_STAGING = YES
 > @@ -14,6 +14,9 @@ FREETYPE_LICENSE_FILES = docs/LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
 >  FREETYPE_DEPENDENCIES = host-pkgconf
 >  FREETYPE_CONFIG_SCRIPTS = freetype-config
 
 > +# since 2.9.1 needed for freetyep-config install

s/freetyep/freetype/

> +FREETYPE_CONF_OPTS = --enable-freetype-config

We probably also need this for the host variant. Committed after adding
that, thanks.

-- 
Bye, Peter Korsgaard
