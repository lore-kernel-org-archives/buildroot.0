From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2020 16:39:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/pigz: add host package support
In-Reply-To: <20200310095816.5404-1-lpdev@cordier.org> (Louis-Paul Cordier's
 message of "Tue, 10 Mar 2020 10:58:16 +0100")
References: <20200310095816.5404-1-lpdev@cordier.org>
Message-ID: <87v9mi9cjx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Louis-Paul" == Louis-Paul Cordier <lpdev@cordier.org> writes:

 > Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
 > ---
 >  package/Config.in.host      |  1 +
 >  package/pigz/Config.in      |  1 +
 >  package/pigz/Config.in.host |  9 +++++++++
 >  package/pigz/pigz.mk        | 10 ++++++++++
 >  4 files changed, 21 insertions(+)
 >  create mode 100644 package/pigz/Config.in.host

 > diff --git a/package/Config.in.host b/package/Config.in.host
 > index c0ac4fbbcc..8eed4727bd 100644
 > --- a/package/Config.in.host
 > +++ b/package/Config.in.host
 > @@ -50,6 +50,7 @@ menu "Host utilities"
 >  	source "package/opkg-utils/Config.in.host"
 >  	source "package/parted/Config.in.host"
 >  	source "package/patchelf/Config.in.host"
 > +	source "package/pigz/Config.in.host"
 >  	source "package/pkgconf/Config.in.host"
 >  	source "package/pru-software-support/Config.in.host"
 >  	source "package/pwgen/Config.in.host"
 > diff --git a/package/pigz/Config.in b/package/pigz/Config.in
 > index af229060cf..a76146d8fc 100644
 > --- a/package/pigz/Config.in
 > +++ b/package/pigz/Config.in
 > @@ -2,6 +2,7 @@ config BR2_PACKAGE_PIGZ
 >  	bool "pigz"
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 >  	select BR2_PACKAGE_ZLIB
 > +	select BR2_PACKAGE_HOST_ZLIB

Ehh, it looks like this should have been added to Config.in.host? Care
to send a patch fixing that?


 > +config BR2_PACKAGE_HOST_PIGZ
 > +	bool "host pigz"
 > +	help
 > +	  pigz, which stands for parallel implementation of gzip, is a
 > +	  fully functional replacement for gzip that exploits multiple
 > +	  processors and multiple cores to the hilt when compressing
 > +	  data.

-- 
Bye, Peter Korsgaard
