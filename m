From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jul 2008 15:08:18 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707152546.GH15840@mx.loc> (Bernhard Fischer's message of
	"Mon\, 7 Jul 2008 17\:25\:46 +0200")
References: <20080704222950.E76B63C61F@busybox.net>
	<87fxqmg53j.fsf@macbook.be.48ers.dk> <48720878.3070602@atmel.com>
	<20080707123642.GA15840@mx.loc> <87ej654uuu.fsf@macbook.be.48ers.dk>
	<20080707152546.GH15840@mx.loc>
Message-ID: <87hcazxl19.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> Me or Ulf? For me, see r22607. Makefile.autotools.in is kinda
 >> broken as the download target is executed even if the download
 >> exists (E.G. it

 Bernhard> Ok that's broken.

 Bernhard> $(BUILD_DIR)/%/.stamp_download_tarball:
 Bernhard> 	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
 Bernhard> 	# or $(if $(BR2_PRIMARY_SITE),$(BR2_PRIMARY_SITE),$($(PKG)_SITE))/$($(PKG)_SOURCE) if you want to support that primary site stuff
 Bernhard> 	touch $@

That won't work if you do a clean and rebuild or reuse a download dir
for another build. You have to really make $(DL_DIR)/$($(PKG)_SOURCE)
the target.

I guess we could use wget -c, but that would be kinda lame (and
dangerous).

-- 
Bye, Peter Korsgaard
