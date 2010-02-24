From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Feb 2010 21:46:16 +0100
Subject: [Buildroot] [git commit master] xfont_font-util: convert to the
	autotools infrastructure
In-Reply-To: <4B8589C4.5060206@gmail.com> (Paulius Zaleckas's message of "Wed, 
	24 Feb 2010 22:19:16 +0200")
References: <20100223202924.D6947776A1@busybox.osuosl.org>
	<4B844BFC.6030906@gmail.com> <87aauzei61.fsf@macbook.be.48ers.dk>
	<4B8589C4.5060206@gmail.com>
Message-ID: <87zl2y746f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

Hi,

 >> Why? Isn't xfont-utils a bunch of programs to run on the target? Staging
 >> is normally for libs.
 >> 

 Paulius> Well now we have:

 >> XFONT_FONT_UTIL_POST_INSTALL_STAGING_HOOKS += XFONT_FONT_UTIL_POST_INSTALL_FIXES

 Paulius> Why do we need POST_INSTALL_STAGING hook when we installed
 Paulius> only to TARGET?

True. The package used to only install into staging dir before Thomas'
commit, which also doesn't make much sense - Thomas?

 >> $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util))

 Paulius> Actually I believe it was installed in to staging for some reason...

Presumably yes, but I don't right away see why.

 Paulius> I have ~200 patches (will post them soon :)) to update X.Org
 Paulius> to 7.5 and I had to change post-install.sh script to new
 Paulius> location for pkg-config or else it would fail building
 Paulius> fonts... if I remember correctly.

Sounds good!

-- 
Bye, Peter Korsgaard
