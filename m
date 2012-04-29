From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Apr 2012 10:36:05 +0200
Subject: [Buildroot] [PATCH 2/2] lsof: add busybox tweaks
In-Reply-To: <201204272354.58069.arnout@mind.be> (Arnout Vandecappelle's
 message of "Fri, 27 Apr 2012 23:54:57 +0200")
References: <1335435324-18792-1-git-send-email-gustavo@zacarias.com.ar>
 <20120426164511.2f6e462d@skate>
 <20120427005558.GA20161@game.jcrosoft.org>
 <201204272354.58069.arnout@mind.be>
Message-ID: <87ehr77x56.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > Now, whether we should change those guidelines to something else is a
 >> > different story. But if we change the guideline, it should be changed
 >> > for all packages and not just for lsof.
 >> package/kmod/Config.in is already like this

The main reason why it's done like this is that it's only the _TOOLS
suboption that should depend on the _SHOW_OTHERS option.

 >> and it's more clean

 Arnout>  I agree that it's better to do it in the package's Config.in.

 Arnout>  And changing the guideline doesn't automatically mean that all
 Arnout> packages have to change.  Only new packages (or patches) must follow 
 Arnout> the guideline.

True. But the first thing to decide on is if this _SHOW_OTHERS option is
really useful. It was afaik introduced long time ago to encourage people
to use the busybox applets instead of the full blown versions, but
perhaps we should just let people decide for themselves?

-- 
Bye, Peter Korsgaard
