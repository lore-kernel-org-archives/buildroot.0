From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Feb 2010 22:49:58 +0100
Subject: [Buildroot] [git commit master] xfont_font-util: convert to the
	autotools infrastructure
In-Reply-To: <4B844BFC.6030906@gmail.com> (Paulius Zaleckas's message of "Tue, 
	23 Feb 2010 23:43:24 +0200")
References: <20100223202924.D6947776A1@busybox.osuosl.org>
	<4B844BFC.6030906@gmail.com>
Message-ID: <87aauzei61.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

Hi,

 >> -$(XFONT_FONT_UTIL_DIR)/.installed: $(XFONT_FONT_UTIL_DIR)/.compiled
 >> -	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(XFONT_FONT_UTIL_DIR) install
 >> -	touch $@
 >> -

 Paulius> Shouldn't font-utils be installed to STAGING instead of TARGET?
 Paulius> Originally it was installed to STAGING.
 Paulius> I would suggest adding:

 Paulius> XFONT_FONT_UTIL_INSTALL_STAGING = YES
 Paulius> XFONT_FONT_UTIL_INSTALL_TARGET = NO

Why? Isn't xfont-utils a bunch of programs to run on the target? Staging
is normally for libs.

-- 
Bye, Peter Korsgaard
