From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Fri, 2 May 2014 18:27:25 +0200 (CEST)
Subject: [Buildroot] [PATCH] lsof: fix "'TCP_*' undeclared" build errors
In-Reply-To: <61985964.1908854.1399044584132.JavaMail.zimbra@advansee.com>
References: <1399042764-22388-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1399042764-22388-2-git-send-email-benoit.thebaudeau@advansee.com>
 <61985964.1908854.1399044584132.JavaMail.zimbra@advansee.com>
Message-ID: <275983561.1911680.1399048045010.JavaMail.zimbra@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, May 2, 2014 5:29:44 PM, Beno?t Th?baudeau wrote:
> On Friday, May 2, 2014 4:59:24 PM, Beno?t Th?baudeau wrote:
> > diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
> > index aa101e4..66d2133 100644
> > --- a/package/lsof/lsof.mk
> > +++ b/package/lsof/lsof.mk
> > @@ -47,7 +47,8 @@ endef
> >  define LSOF_CONFIGURE_CMDS
> >  	(cd $(@D) ; \
> >  		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)
> >  		$(BR2_LSOF_CFLAGS)" \
> > -		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1
> > ./Configure linux)
> > +		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 \
> > +		LSOF_CC="cc --sysroot $(STAGING_DIR)" ./Configure linux)
> 
> It'd be better if $(STAGING_DIR) were quoted.

Actually not because such quotes cause other issues in the configure tests, e.g.
time.h not being found in the test for strftime().

Beno?t
