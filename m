From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 15:09:00 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tvheadend: Fix static build
In-Reply-To: <20150826123603.GA3699@free.fr>
References: <1440537516-1908-1-git-send-email-bernd.kuhls@t-online.de>
 <20150826123603.GA3699@free.fr>
Message-ID: <20150826150900.7acf16e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 26 Aug 2015 14:36:03 +0200, Yann E. MORIN wrote:

> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +# remove hardcoded -ldl for static builds
> > +define TVHEADEND_FIX_MAKEFILE_FOR_STATIC_BUILD
> > +	$(SED) 's/-ldl -lpthread -lm/-lpthread -lm/' $(@D)/Makefile
> 
> Are you sure?
> 
> src/extra/capmt_ca.c uses dlsym() so it does need -ldl.

This file is not built by default, it's part of the extras.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
