From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 09 Jul 2007 15:08:55 +0200
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs
	$(MAKE)	$(TARGET_CONFIGURE_OPTS)
In-Reply-To: <f0528b5b0707090641j2bd8c39ap101012d7716ba67b@mail.gmail.com>
References: <20070706155558.GA18954@real.realitydiluted.com>
	<20070707130132.GU4096@aon.at>
	<1183824383.19912.5.camel@elrond.sweden.atmel.com>
	<20070707172925.GV4096@aon.at>
	<1183837025.19912.17.camel@elrond.sweden.atmel.com>
	<20070707211606.GZ4096@aon.at>
	<05fb01c7c0e9$275c45a0$dcc4af0a@atmel.com>
	<20070709082550.GA19774@aon.at> <20070709092108.GA20627@aon.at>
	<20070709122041.GA30238@real.realitydiluted.com>
	<f0528b5b0707090641j2bd8c39ap101012d7716ba67b@mail.gmail.com>
Message-ID: <1183986535.5278.16.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-07-09 klockan 15:41 +0200 skrev Julien Letessier:
> I'm following the discussion and would like to make a point:
> all of this is irrelevant for packages that use the GNU auto* tools
> properly (i.e. a whole lot of packages).
> 
> Their configure script uses the TARGET_CONFIGURE_OPTS to generate
> correct makefiles, and no flags should thereafter be passed to $(MAKE)
> directly (or they'll break). 
> So IMO, 
>    $(MAKE) -C $(FOO_DIR) $(TARGET_CONFIGURE_OPTS)
> will almost always break such a package. Even packages that just
>    $(MAKE) -C $(FOO_DIR) CC=$(TARGET_CC)
> break more often than not.


The question I asked, where I did not get an answer was:

Is there any case where

    $(TARGET_CONFIGURE_OPTS)  $(MAKE) -C $(FOO_DIR)

is correct but

    $(MAKE) $(TARGET_CONFIGURE_OPTS)  -C $(FOO_DIR)

is not.

I know that there are cases (mtd) when the other way around
is definitely incorrect.


Best Regards
Ulf Samuelsson
