From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Nov 2014 00:26:24 +0100
Subject: [Buildroot] [PATCH] package/rpm: add missing dependency to
	openssl
In-Reply-To: <1416178563-624-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 16 Nov 2014 23:56:03 +0100")
References: <1416178563-624-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87h9xyd8wv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We forcibly enable use of an extrernal openssl in rpm, so we must depend
 > on it.

 > openssl is correctly selected from kconfig, but there is no build-time
 > dependency to it.

 > It was not an issue so far, because openssl always sorts before rpm, so
 > gets built before. Unless one wants to just build rpm to debug an
 > autobuilder failure, that is.

 > Add that build-time dependency to openssl.

Committed, thanks.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/rpm/rpm.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
 > index af1642f..50e6d75 100644
 > --- a/package/rpm/rpm.mk
 > +++ b/package/rpm/rpm.mk
 > @@ -7,7 +7,7 @@
 >  RPM_VERSION_MAJOR = 5.2
 >  RPM_VERSION = $(RPM_VERSION_MAJOR).0
 >  RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)
 > -RPM_DEPENDENCIES = zlib beecrypt neon popt
 > +RPM_DEPENDENCIES = zlib beecrypt neon popt openssl

A quick check seems to show that zlib isn't selected from Config.in. Is
it needed (besides indirectly from openssl)?

-- 
Bye, Peter Korsgaard
