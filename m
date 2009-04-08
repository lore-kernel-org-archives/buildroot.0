From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Apr 2009 20:34:38 +0200
Subject: [Buildroot] DBUS keeps getting installed...
In-Reply-To: <200904081213.21064.lsargent@txdigital.com> (Lloyd Sargent's
	message of "Wed\, 8 Apr 2009 12\:13\:21 -0500")
References: <200904081213.21064.lsargent@txdigital.com>
Message-ID: <87prfnyoxt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lloyd" == Lloyd Sargent <lsargent@txdigital.com> writes:

Hi,

 Lloyd> Okay, I'm really puzzled. In my initial build I had
 Lloyd> DBUS. Well, it was taking too many resources so I removed it.

 Lloyd> Or so I thought.

 Lloyd> In my next build, there was DBUS again!

 Lloyd> So I checked the .config file:

 Lloyd> # BR2_PACKAGE_DBUS is not set

 Lloyd> Perhaps I misread something, but I was under the impression
 Lloyd> that if DBUS was not set, then it wouldn't be included in the
 Lloyd> build?

That's true. Do you do a clean rebuild (rm -rf *build_*) or just edit
the configuration and run make again? Packages don't automatically get
removed from the target file system if you deselect them again.

The other option is some other package needing dbus, and hence forcing
it to be built, but then it should normally also depend / select it in
Kconfig, so you should see it in your .config

Could you post your .config please?

-- 
Bye, Peter Korsgaard
