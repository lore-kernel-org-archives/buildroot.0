From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 11:30:42 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/openobex: fix broken
	download URL, add hash
In-Reply-To: <1454233738-8795-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Sun, 31 Jan 2016 10:48:58 +0100")
References: <1454233738-8795-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <8760yajb1p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: forgot hash file (Baruch)

 >  package/openobex/Config.in     |  2 +-
 >  package/openobex/openobex.hash |  3 +++
 >  package/openobex/openobex.mk   | 12 ++++++++++--
 >  3 files changed, 14 insertions(+), 3 deletions(-)
 >  create mode 100644 package/openobex/openobex.hash

 > diff --git a/package/openobex/Config.in b/package/openobex/Config.in
 > index 5f606fe..2b8cf38 100644
 > --- a/package/openobex/Config.in
 > +++ b/package/openobex/Config.in
 > @@ -4,7 +4,7 @@ config BR2_PACKAGE_OPENOBEX
 >  	  Free open source implementation of the Object Exchange (OBEX)
 >  	  protocol.
 
 > -	  http://www.openobex.org
 > +	  http://sourceforge.net/projects/openobex
 
 >  if BR2_PACKAGE_OPENOBEX
 
 > diff --git a/package/openobex/openobex.hash b/package/openobex/openobex.hash
 > new file mode 100644
 > index 0000000..2aef981
 > --- /dev/null
 > +++ b/package/openobex/openobex.hash
 > @@ -0,0 +1,3 @@
 > +# From http://sourceforge.net/projects/openobex/files/openobex/1.5/
 > +sha1	5332ef95bc8b321bda675cdb74379804c6c1a83f	openobex-1.5.0-Source.zip
 > +md5	f6d87af55a1d702d582173c81619176e		openobex-1.5.0-Source.zip
 > diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
 > index 82bfd43..b50dbb7 100644
 > --- a/package/openobex/openobex.mk
 > +++ b/package/openobex/openobex.mk
 > @@ -4,8 +4,10 @@
 >  #
 >  ################################################################################
 
 > -OPENOBEX_VERSION = 1.5
 > -OPENOBEX_SITE = http://ftp.osuosl.org/pub/linux/bluetooth
 > +OPENOBEX_VERSION_MAJOR = 1.5
 > +OPENOBEX_VERSION = $(OPENOBEX_VERSION_MAJOR).0
 > +OPENOBEX_SITE = http://downloads.sourceforge.net/project/openobex/openobex/$(OPENOBEX_VERSION_MAJOR)
 > +OPENOBEX_SOURCE = openobex-$(OPENOBEX_VERSION)-Source.zip

I see upstream has released 1.7.1 (in a normall tarball). Any reason we
don't use that instead?

-- 
Bye, Peter Korsgaard
