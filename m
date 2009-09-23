From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Sep 2009 13:09:27 +0200
Subject: [Buildroot] [PATCH] Rename BASE_DIR to OUTPUT_DIR
In-Reply-To: <200909231237.58227.mroth@nessie.de> (Michael Roth's message of
	"Wed\, 23 Sep 2009 12\:37\:52 +0200")
References: <1253700233-11103-1-git-send-email-mroth@nessie.de>
	<878wg6rmes.fsf@macbook.be.48ers.dk>
	<200909231237.58227.mroth@nessie.de>
Message-ID: <87iqf9rk7s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

Hi,

 >> Hmm, this will presumably break downloads for people trying to reuse
 >> their existing .config? (E.G. DL_DIR gets to point to /dl).

 Michael> Hmm... Yes, I think you're right.

 >> I agree that BASE_DIR isn't the most telling name for what it does,
 >> but I'm not sure it's worth the trouble.

 Michael> OTOH: The introduced change to the directory hierarchy "broke"
 Michael> the download directory from '$(TOPDIR)/dl' to
 Michael> '$(TOPDIR)/output/dl'.

Yes, but the difference is that that change didn't cause a build
failure, only a slight inconvenience.

The same with staging moving from build_*/staging_dir -> staging, the
old location still works.

 Michael> Maybe the directory hierarchy change introduced some other
 Michael> inconvenience so maybe a big fat warning that some things
 Michael> changed in the documentation is the way to go?

Yes, we'll probably need that anyway.

 Michael> Or, maybe a hook in 'make oldconfig' could fix that?

I would prefer to not add extra code complexity for this (relative
minor) cleanup.

-- 
Bye, Peter Korsgaard
